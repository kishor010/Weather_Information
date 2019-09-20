//
//  NetworkManager.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

private let _sharedInstance = WeatherNetworkManager()
private let DEBUG_MODE = true

class WeatherNetworkManager {
    
    //MARKS: Shared Instance
    private let restClient = RestClient()
    
    fileprivate init(){}
    
    static var sharedInstance: WeatherNetworkManager {
        return _sharedInstance
    }
    
    //MARK: Network Call Methods
    func getWeatherInfo(city: String, onSuccess: @escaping onSuccess,
                        onFailure: @escaping onFailure)  {
        let _url: URLRequestConvertible = WeatherAPIRouter.Router.weatherInfo(city: city)
        restClient.makeRequest(url: _url, onSuccess: onSuccess, onFailure: onFailure)
    }
}

// MARK: - REST CLIENT -
fileprivate class RestClient {
    
    fileprivate func makeRequest(url: URLRequestConvertible,
                                 onSuccess: @escaping onSuccess,
                                 onFailure: @escaping onFailure
        ) -> Void {
        
        Alamofire.request(url)
            .validate()
            .responseJSON { response in
                
                if DEBUG_MODE {
                    print("--------START---------")
                    print(response) // print response
                    print(response.request ?? "")  // original URL request
                    print(response.response ?? "") // HTTP URL response
                    print(response.data ?? "")     // server data
                    print(response.result)   // result of response serialization
                    print(url)
                }
                
                switch response.result {
                case .success:
                    if let result = response.result.value {
                        let json = JSON(result)
                        onSuccess(json)
                    }
                    break
                    
                case .failure:
                    print("failure \(response)")
                    onFailure(response.error?.localizedDescription ?? "Error")
                    break
                }
        }
    }
}








