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
    var pressure: String?
    
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





//--------_Codable--------------
/*//SON is an agreed upon format for webservices, APIs and apps. ... The Codable protocol is used to go from a JSON data object to an actual Swift class or struct. This is called decoding, because the JSON data is decoded into a format that Swift understands. It also works the other way: encoding Swift objects as JSON.
*/


//--------------------- NSCoding ------------------------

/*class Product: NSObject, NSCoding {
    var title:String
    var price:Double
    var quantity:Int
    
    enum Key:String {
        case title = "title"
        case price = "price"
        case quantity = "quantity"
    }
    
    init(title:String,price:Double, quantity:Int) {
        self.title = title
        self.price = price
        self.quantity = quantity
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Key.title.rawValue)
        aCoder.encode(price, forKey: Key.price.rawValue)
        aCoder.encode(quantity, forKey: Key.quantity.rawValue)
    }
    convenience required init?(coder aDecoder: NSCoder) {
        let price = aDecoder.decodeDouble(forKey: Key.price.rawValue)
        let quantity = aDecoder.decodeInteger(forKey: Key.quantity.rawValue)
        guard let title = aDecoder.decodeObject(forKey: Key.title.rawValue) as? String else { return nil }
        self.init(title:title,price:price,quantity:quantity)
    }
}*/
