//
//  ForecastDetailVC.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import UIKit

class ForecastDetailVC: UIViewController {
    
    var weatherData: WeatherData? 
    private var forecastDetailVCPresenter: ForecastDetailVCPresenter!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    
    @IBOutlet weak var sunriseTimeLbl: UILabel!
    @IBOutlet weak var sunsetTimeLbl: UILabel!
    @IBOutlet weak var moonPhaseLbl: UILabel!
    @IBOutlet weak var precipIntensityLbl: UILabel!
    @IBOutlet weak var precipIntensityMaxLbl: UILabel!
    @IBOutlet weak var precipIntensityMaxTimeLbl: UILabel!
    @IBOutlet weak var precipProbabilityLbl: UILabel!
    @IBOutlet weak var precipTypeLbl: UILabel!
    @IBOutlet weak var dewPointLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windGustLbl: UILabel!
    @IBOutlet weak var windGustTimeLbl: UILabel!
    @IBOutlet weak var windBearingLbl: UILabel!
    @IBOutlet weak var cloudCoverLbl: UILabel!
    @IBOutlet weak var uvIndexLbl: UILabel!
    @IBOutlet weak var uvIndexTimeLbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var ozoneLbl: UILabel!
    @IBOutlet weak var temperatureMinLbl: UILabel!
    @IBOutlet weak var temperatureMinTimeLbl: UILabel!
    @IBOutlet weak var temperatureMaxLbl: UILabel!
    @IBOutlet weak var temperatureMaxTimeLbl: UILabel!
    @IBOutlet weak var apparentTemperatureMinLbl: UILabel!
    @IBOutlet weak var apparentTemperatureMinTimeLbl: UILabel!
    @IBOutlet weak var apparentTemperatureMaxLbl: UILabel!
    @IBOutlet weak var apparentTemperatureMaxTimeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetUp()
        setUpViews()
    }
    
    private func initialSetUp() {
        
        forecastDetailVCPresenter = ForecastDetailVCPresenter.init(forecastDetailVC: self)
    }
    
    private func setUpViews() {
        
        guard weatherData != nil else {
            return
        }
        forecastDetailVCPresenter.setUpViewWithWeatherData(weatherData!)
    }
}
