//
//  WeatherViewController.swift
//  OpenWeather
//
//  Created by Kishor Pahalwani on 20/09/19.
//  Copyright © 2019 Kishor Pahalwani. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presentor:ViewToPresenterProtocol?
    var weatherInfo: WeatherEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setUpDelegates()
        fetchWeatherInfo()
    }
    
    fileprivate func setupTableView() {
        self.tableView.tableFooterView = UIView()
    }
    
    fileprivate func setUpDelegates() {
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = WeatherPresenter()
        let interactor: PresenterToInteractorProtocol = WeatherInteractor()
        let router:PresenterToRouterProtocol = WeatherRouter()
        
        self.presentor = presenter
        presenter.view = self.presentor?.view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    private func fetchWeatherInfo() {
        self.title = "Weather"
        presentor?.startFetchingWeatherInfo(city: "Bangalore")
        showProgressIndicator(view: self.view)
    }
}

extension WeatherViewController: PresenterToViewProtocol {
    func showWeatherInfo(info: WeatherEntity) {
        self.tableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func showError(error: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /*func showNotice(noticeArray: Array<NoticeModel>) {
        self.noticeArrayList = noticeArray
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func showError() {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }*/
}


//MARK :- Table View Delegates
extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


