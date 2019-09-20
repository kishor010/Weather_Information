//
//  WeatherInteractor.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import Foundation
import Alamofire

class WeatherInteractor: PresenterToInteractorProtocol {
    
    /*func fetchWeatherInfo() {
        Alamofire.request(API_NOTICE_LIST).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["notice_list"] as! NSArray
                    let arrayObject = Mapper<NoticeModel>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.noticeFetchedSuccess(noticeModelArray: arrayObject)
                }
            }else {
                self.presenter?.noticeFetchFailed()
            }
        }
    }*/
    
    
    func fetchWeatherInfo(city: String) {
        WeatherNetworkManager.sharedInstance.getWeatherInfo(city: city, onSuccess: { (json) in
            debugPrint(json)
        }) { (error) in
            debugPrint(error)
        }
    }
    
    var presenter: InteractorToPresenterProtocol?
    
    
}
