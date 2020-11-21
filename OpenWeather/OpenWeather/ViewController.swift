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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

