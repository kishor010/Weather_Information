//
//  WeatherInteractor.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchWeatherInfo(city: String) {
        WeatherNetworkManager.sharedInstance.getWeatherInfo(city: city, onSuccess: { (json) in
            self.presenter?.success(info: self.BindingWeatherInfo(json: json, city: city))
        }) { (error) in
            debugPrint(error)
            self.presenter?.Failure(error: error)
        }
    }
    
    private func BindingWeatherInfo(json: JSON, city: String) -> WeatherEntity {
        
        var description = ""
        var seaLevel = ""
        let temp = "\(json["main"]["temp"].rawValue)"
        let humidity = "\(json["main"]["humidity"].rawValue)"
        let pressure = "\(json["main"]["pressure"].rawValue)"
        let speed = "\(json["wind"]["speed"].rawValue)"
        
        
        if (json["main"]["sea_level"].rawValue as? NSNumber != nil) {
            seaLevel = "\(json["main"]["sea_level"].rawValue)"
        }
        
        for ( info) in json["weather"].enumerated() {
            description = ((info.element.1["description"].rawValue) as? String) ?? ""
        }
        
        print(json)
        let weatherEntity = WeatherEntity(description:description, temp: temp, humidity: humidity, seaLevel: seaLevel, city: city, windSpeed: speed, pressure: pressure)
        
        return weatherEntity
    }
}
