//
//  WeatherEntity.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 19/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation


class WeatherEntity: Codable {
    
    /*var weather:String
    var temp:String
    var pressure:String
    var humidity: String
    var visibility: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case quantity
    }
    
    init(title:String,price:Double, quantity:Int) {
        self.title = title
        self.price = price
        self.quantity = quantity
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(price, forKey: .price)
        try container.encode(quantity, forKey: .quantity)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        quantity = try container.decode(Int.self, forKey: .quantity)
    }*/
}



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



//--------------------- Codable ------------------------

//SON is an agreed upon format for webservices, APIs and apps. ... The Codable protocol is used to go from a JSON data object to an actual Swift class or struct. This is called decoding, because the JSON data is decoded into a format that Swift understands. It also works the other way: encoding Swift objects as JSON.

/*struct Product: Codable {
    var title:String
    var price:Double
    var quantity:Int
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case quantity
    }
    init(title:String,price:Double, quantity:Int) {
        self.title = title
        self.price = price
        self.quantity = quantity
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(price, forKey: .price)
        try container.encode(quantity, forKey: .quantity)
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        quantity = try container.decode(Int.self, forKey: .quantity)
    }
}*/

/* NSCoding is the Objective-C way of archiving data and Codable is the Swift way.
which is helpful because many Apple types such as UIColor and UIImage conform to NSCoding but not Codable.*/
