//
//  ForecastListCell.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import UIKit

class ForecastListCell: UITableViewCell {
    
    @IBOutlet private weak var dateLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    
    func setWeatherData(_ weatherData: WeatherData, showTemperatureType: AppConstants.TEMPERATURE_TYPE) {
        
        self.dateLbl.text = Date.init(timeIntervalSince1970: TimeInterval(weatherData.time)).getStringWithDateFormatter("dd/MM/yyyy")
        self.summaryLbl.text = weatherData.summary
        
        if var temperature = weatherData.temperatureMax {
            
            if showTemperatureType == .FAHRENHEIT && temperature.type != .FAHRENHEIT {
                temperature = Temperature(degree: CommonFunctions.convertToFahrenheit(celsius: temperature.degree), type: .FAHRENHEIT)
            }else if showTemperatureType == .CELSIUS && temperature.type != .CELSIUS {
                temperature = Temperature(degree: CommonFunctions.convertToCelsius(fahrenheit: temperature.degree), type: .CELSIUS)
            }
            
            self.temperatureLbl.text = temperature.convertToString()
        }else {
            self.temperatureLbl.text = ""
        }
    }
}
