//
//  ViewController.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 19/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func SetViperDelegates() {
        
        /*let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
        let interactor: PresenterToInteractorProtocol = NoticeInteractor()
        let router:PresenterToRouterProtocol = NoticeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter*/
    }
    
    @IBAction func BtnWeatherTappedAction(_ sender: Any) {
        if let openWeatherViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController {
            self.navigationController?.show(openWeatherViewController, sender: nil)
        }
    }
    
    deinit {
        debugPrint("Deinitialize (No Memory leaks)")
    }
}

