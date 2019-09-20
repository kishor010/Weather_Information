//
//  WeatherRouter.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class WeatherRouter: PresenterToRouterProtocol {
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToSomeOtherScreen(navigationConroller navigationController:UINavigationController) {
      //We can navigate from one controller to another
    }
}
