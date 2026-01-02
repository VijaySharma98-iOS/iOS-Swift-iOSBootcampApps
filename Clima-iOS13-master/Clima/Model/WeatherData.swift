//
//  WeatherData.swift
//  Clima
//
//  Created by Vijay Sharma on 17/12/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    let name: String?
    let main: MainData?
    let weather: [Weather]?

    enum CodingKeys: String, CodingKey {
        case name
        case main
        case weather
    }
}

struct MainData: Codable {
    let temp: Double?

    enum CodingKeys: String, CodingKey {
        case temp
    }
}

struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
