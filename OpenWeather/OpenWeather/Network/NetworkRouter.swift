//
//  NetworkRouter.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation
import Alamofire

private let requestTimeOut: TimeInterval = 60

class WeatherAPIRouter {
    
    enum Router: URLRequestConvertible {
        
        //MARK:- Cases
        case weatherInfo(city: String)
        
        //MARK:- HTTP Method
        var method: HTTPMethod {
            switch self {
            case .weatherInfo:
                return .get
            }
        }
        
        //Base URL
        var baseUrl: String {
            return "https://api.openweathermap.org/data/2.5/weather?appid=9248b4fb9fac922440b21572a24b3254&q="
        }
        
        //MARK:- API Path
        var path: String {
            switch self {
                case .weatherInfo(let city):
                return "\(city)"
            }
        }
        
        //Method URLRequest
        func asURLRequest() throws -> URLRequest {
            if let url =  URL(string: baseUrl + path) {
                var urlRequest = URLRequest(url:url)
                urlRequest.httpMethod = method.rawValue
                urlRequest.timeoutInterval = requestTimeOut
                urlRequest = try URLEncoding.default.encode(urlRequest, with: nil)
                return urlRequest
            }
                
            else {
                return URLRequest(url:URL(string: "")!)
            }
        }
    }
}





