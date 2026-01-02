//
//  WeatherManager.swift
//  Clima
//
//  Created by Vijay Sharma on 15/12/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=1e6c2c8871638674001bef8d531db838&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(for: urlString)
    }
    
    func fetchWeather(latitude:Double,longitude: Double) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
        performRequest(for: urlString)
    }
    
    
    func performRequest(for urlString: String) {
        if let url = URL(string: urlString) {
            
            let urlSession = URLSession(configuration: .default)
            
            let task = urlSession.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                dump(data)
                if let safeData = data {
                    let weather = self.parseJSON(weatherData: safeData)
                    
                    if let weather = weather {
                        delegate?.didUpdateWeather(self, weather: weather)
                    } else {
                        print("Data is empty")
                    }
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let weatherId = decodeData.weather?[0].id ?? 0
            let temp = decodeData.main?.temp ?? 0.0
            let name = decodeData.name ?? ""
            
            let weather = WeatherModel(conditionId: weatherId, cityName: name, temperature: temp)
            return weather
            
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    

}
