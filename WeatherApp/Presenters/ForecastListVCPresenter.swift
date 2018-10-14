//
//  ForecastListVCPresenter.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation
import CoreLocation


class ForecastListVCPresenter {
    
    let forecastListVC: ForecastListVC!
    
    init(forecastListVC: ForecastListVC) {
        
        self.forecastListVC = forecastListVC
    }
    
    func fetchDailyWeatherForecastForLocation(_ location: CLLocation) {
        
        forecastListVC.startLoaderAnimation(true)
        let weatherInteractor = WeatherInteractor()
        
        weatherInteractor.getDailyWeatherForecastForLocation(location) { (weather) in
            
            DispatchQueue.main.async {
                self.forecastListVC.startLoaderAnimation(false)
                guard weather != nil else {
                    self.forecastListVC.showFailureAlert()
                    return
                }
                self.forecastListVC.weather = weather
            }
        }
    }
}



