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
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var labelSearchMessgae: UILabel!
    
    var presentor:ViewToPresenterProtocol?
    var weatherInfo: WeatherEntity?
    var numberOfCell = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setUpDelegates()
        showWeatherInfoList(value: false)
    }
    
    fileprivate func setupTableView() {
        self.tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Weather Info"
    }
    
    fileprivate func setUpDelegates() {
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = WeatherPresenter()
        let interactor: PresenterToInteractorProtocol = WeatherInteractor()
        let router:PresenterToRouterProtocol = WeatherRouter()
        
        self.presentor = presenter
        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        searchBar.delegate = self
    }
    
    private func showWeatherInfoList(value: Bool) {
        tableView.isHidden = !value
        labelSearchMessgae.isHidden = value
        
        if value == true {
            numberOfCell = 1
        }
        
        else {
            numberOfCell = 0
        }
    }
    
    private func fetchWeatherInfo(city: String) {
        presentor?.startFetchingWeatherInfo(city: city)
        showProgressIndicator(view: self.view)
    }
}

//MARK :- Search bar result
extension WeatherViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Call searchBarSearchButtonClicked")
        
        if let seachBarText = searchBar.text, seachBarText != "" {
            fetchWeatherInfo(city: seachBarText)
        }
        //searchBar.text
        searchBar.resignFirstResponder()
    }

    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("Call searchBarResultsListButtonClicked")
        searchBar.resignFirstResponder()
    }
}

//MARK:- Protocol Inherit methods
extension WeatherViewController: PresenterToViewProtocol {
    func showWeatherInfo(info: WeatherEntity) {
        self.weatherInfo = info
        if weatherInfo != nil {
            showWeatherInfoList(value: true)
            self.tableView.reloadData()
            hideProgressIndicator(view: self.view)
        }
    }
    
    func showError(error: String) {
        hideProgressIndicator(view: self.view)
        showWeatherInfoList(value: false)
        let alert = Helper.showAlert( AlertTitle: "Error....", AlertMessage: error)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK :- Table View Delegates
extension WeatherViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Constant.weatherCell) as? WeatherInfoCell
        
        if (nil == cell) {
            var nib:Array = Bundle.main.loadNibNamed(Constant.weatherCell, owner: self, options: nil)!
            cell = nib[0] as? WeatherInfoCell
        }
        
        cell?.labelDescription.text = Constant.description + (weatherInfo?.description ?? "")
        cell?.labelTemp.text = Constant.temp + (weatherInfo?.temp ?? "")
        cell?.labelHumidity.text = Constant.humidity + (weatherInfo?.humidity ?? "")
        cell?.labelCity.text = Constant.city + (weatherInfo?.city ?? "")
        cell?.labelPressure.text = Constant.pressure + (weatherInfo?.pressure ?? "")
        cell?.labelSeaLevel.text = Constant.seaLevel + (weatherInfo?.seaLevel ?? "")
        cell?.labelWindSpeed.text = Constant.windSpeed + (weatherInfo?.windSpeed ?? "")
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight = 100;
        return UITableView.automaticDimension
    }
}


