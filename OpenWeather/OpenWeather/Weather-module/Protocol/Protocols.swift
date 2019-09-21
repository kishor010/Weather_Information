//
//  Protocols.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingWeatherInfo(city: String)
}

protocol PresenterToViewProtocol: class{
    func showWeatherInfo(info: WeatherEntity)
    func showError(error: String)
}

protocol PresenterToRouterProtocol: class {
    func pushToSomeOtherScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchWeatherInfo(city: String)
}

protocol InteractorToPresenterProtocol: class {
    func success(info: WeatherEntity)
    func Failure(error: String)
}
