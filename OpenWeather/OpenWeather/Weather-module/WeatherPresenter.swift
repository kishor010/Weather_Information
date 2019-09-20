//
//  WeatherPresenter.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class WeatherPresenter:ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingWeatherInfo(city: String) {
        interactor?.fetchWeatherInfo(city: city)
    }
}

extension WeatherPresenter: InteractorToPresenterProtocol{
    func success(info: WeatherEntity) {
        view?.showWeatherInfo(info: info)
    }
    func Failure(error: String) {
        view?.showError(error: error)
    }
}
