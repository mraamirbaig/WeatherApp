//
//  ForecastListVCPresenter.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation


class ForecastListVCPresenter {
    
    
    let forecastListVC: ForecastListVC!
    
    init(forecastListVC: ForecastListVC) {
        
        self.forecastListVC = forecastListVC
    }
    
    func fetchDailyWeatherForecast() {
        
        forecastListVC.startLoaderAnimation(true)
        let weatherInteractor = WeatherInteractor()
        
        weatherInteractor.getDailyWeatherForeCast { (weather) in
            
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



