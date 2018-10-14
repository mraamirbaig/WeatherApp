//
//  ForecastDetailVCPresenter.swift
//  WeatherApp
//
//  Created by FAB on 10/14/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

class ForecastDetailVCPresenter {
    
    let forecastDetailVC: ForecastDetailVC!
    
    init(forecastDetailVC: ForecastDetailVC) {
        
        self.forecastDetailVC = forecastDetailVC
    }
    
    func setUpViewWithWeatherData(_ weatherData: WeatherData) {
        
        self.forecastDetailVC.dateLbl.text = Date.init(timeIntervalSince1970: TimeInterval(weatherData.time)).getStringWithDateFormatter("dd/MM/yyyy")
        self.forecastDetailVC.summaryLbl.text = weatherData.summary
        
        if let sunriseTime = weatherData.sunriseTime {
            self.forecastDetailVC.sunriseTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(sunriseTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let sunsetTime = weatherData.sunsetTime {
            self.forecastDetailVC.sunsetTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(sunsetTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let moonPhase = weatherData.moonPhase {
            self.forecastDetailVC.moonPhaseLbl.text = moonPhase.convertToString(placeOfDecimal: 2)
        }
        if let precipIntensity = weatherData.precipIntensity {
            self.forecastDetailVC.precipIntensityLbl.text = precipIntensity.convertToString(placeOfDecimal: 2)
        }
        
        if let precipIntensityMax = weatherData.precipIntensityMax {
            self.forecastDetailVC.precipIntensityMaxLbl.text = precipIntensityMax.convertToString(placeOfDecimal: 2)
        }
        
        if let precipIntensityMaxTime = weatherData.precipIntensityMaxTime {
            self.forecastDetailVC.precipIntensityMaxTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(precipIntensityMaxTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let precipProbability = weatherData.precipProbability {
            self.forecastDetailVC.precipProbabilityLbl.text = precipProbability.convertToString(placeOfDecimal: 2)
        }
        
        if let precipType = weatherData.precipType {
            self.forecastDetailVC.precipTypeLbl.text = precipType
        }
        
        if let dewPoint = weatherData.dewPoint {
            self.forecastDetailVC.dewPointLbl.text = dewPoint.convertToString(placeOfDecimal: 2)
        }
        
        if let humidity = weatherData.humidity {
            self.forecastDetailVC.humidityLbl.text = humidity.convertToString(placeOfDecimal: 2)
        }
        
        if let pressure = weatherData.pressure {
            self.forecastDetailVC.pressureLbl.text = pressure.convertToString(placeOfDecimal: 2)
        }
        
        if let windSpeed = weatherData.windSpeed {
            self.forecastDetailVC.windSpeedLbl.text = windSpeed.convertToString(placeOfDecimal: 2)
        }
        
        if let windGust = weatherData.windGust {
            self.forecastDetailVC.windGustLbl.text = windGust.convertToString(placeOfDecimal: 2)
        }
        
        if let windGustTime = weatherData.windGustTime {
            self.forecastDetailVC.windGustTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(windGustTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let windBearing = weatherData.windBearing {
            self.forecastDetailVC.windBearingLbl.text = "\(windBearing)"
        }
        
        if let cloudCover = weatherData.cloudCover {
            self.forecastDetailVC.cloudCoverLbl.text = cloudCover.convertToString(placeOfDecimal: 2)
        }
        
        if let uvIndex = weatherData.uvIndex {
            self.forecastDetailVC.uvIndexLbl.text = "\(uvIndex)"
        }
        
        if let uvIndexTime = weatherData.uvIndexTime {
            self.forecastDetailVC.uvIndexTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(uvIndexTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let visibility = weatherData.visibility {
            self.forecastDetailVC.visibilityLbl.text = visibility.convertToString(placeOfDecimal: 2)
        }
        
        if let ozone = weatherData.ozone {
            self.forecastDetailVC.ozoneLbl.text = ozone.convertToString(placeOfDecimal: 2)
        }
        
        if let temperatureMin = weatherData.temperatureMin {
            self.forecastDetailVC.temperatureMinLbl.text = temperatureMin.convertToString()
        }
        
        if let temperatureMinTime = weatherData.temperatureMinTime {
            self.forecastDetailVC.temperatureMinTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(temperatureMinTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let temperatureMax = weatherData.temperatureMax {
            self.forecastDetailVC.temperatureMaxLbl.text = temperatureMax.convertToString()
        }
        
        if let temperatureMaxTime = weatherData.temperatureMaxTime {
            self.forecastDetailVC.temperatureMaxTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(temperatureMaxTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let apparentTemperatureMin = weatherData.apparentTemperatureMin {
            self.forecastDetailVC.apparentTemperatureMinLbl.text = apparentTemperatureMin.convertToString()
        }
        
        if let apparentTemperatureMinTime = weatherData.apparentTemperatureMinTime {
            self.forecastDetailVC.apparentTemperatureMinTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(apparentTemperatureMinTime)).getStringWithDateFormatter("h:mm a")
        }
        
        if let apparentTemperatureMax = weatherData.apparentTemperatureMax {
            self.forecastDetailVC.apparentTemperatureMaxLbl.text = apparentTemperatureMax.convertToString()
        }
        
        if let apparentTemperatureMaxTime = weatherData.apparentTemperatureMaxTime {
            self.forecastDetailVC.apparentTemperatureMaxTimeLbl.text = Date.init(timeIntervalSince1970: TimeInterval(apparentTemperatureMaxTime)).getStringWithDateFormatter("h:mm a")
        }
    }
}
