//
//  WeatherEntity.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 19/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//


import Foundation

class WeatherEntity: Codable {
    
    var description: String?
    var temp: String?
    var humidity: String?
    var seaLevel: String?
    var city: String?
    var windSpeed: String?
    var pressure: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case temp
        case humidity
        case seaLevel
        case city
        case windSpeed
        case pressure
    }
    
    init(description:String, temp:String, humidity: String, seaLevel: String, city: String, windSpeed: String, pressure: String) {
        self.description = description
        self.temp = temp
        self.humidity = humidity
        self.seaLevel = seaLevel
        self.city = city
        self.windSpeed = windSpeed
        self.pressure = pressure
    }
    
    //Use : Writing (Archieve object in file or any location)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(description, forKey: .description)
        try container.encode(temp, forKey: .temp)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(seaLevel, forKey: .seaLevel)
        try container.encode(city, forKey: .city)
        try container.encode(windSpeed, forKey: .windSpeed)
        try container.encode(pressure, forKey: .pressure)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        description = try container.decode(String.self, forKey: .description)
        temp = try container.decode(String.self, forKey: .temp)
        humidity = try container.decode(String.self, forKey: .humidity)
        seaLevel = try container.decode(String.self, forKey: .seaLevel)
        city = try container.decode(String.self, forKey: .city)
        windSpeed = try container.decode(String.self, forKey: .windSpeed)
        pressure = try container.decode(String.self, forKey: .pressure)
    }
}
