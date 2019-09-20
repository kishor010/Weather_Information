//
//  WeatherRouter.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class WeatherRouter: PresenterToRouterProtocol {
    
    /*static func createModule() -> WeatherViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }*/
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToSomeOtherScreen(navigationConroller navigationController:UINavigationController) {
        
      //We can navigate from one controller to another
    }
}
