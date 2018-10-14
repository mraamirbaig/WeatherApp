//
//  WeatherData.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

struct WeatherData {
    
    var time: Int!
    var summary: String
    var icon: String?
    var sunriseTime: Int?
    var sunsetTime: Int?
    var moonPhase: Double?
    var precipIntensity: Double?
    var precipIntensityMax: Double?
    var precipIntensityMaxTime: Int?
    var precipProbability: Double?
    var precipType: String?
    var dewPoint: Double?
    var humidity: Double?
    var pressure: Double?
    var windSpeed: Double?
    var windGust: Double?
    var windGustTime: Int?
    var windBearing: Int?
    var cloudCover: Double?
    var uvIndex: Int?
    var uvIndexTime: Int?
    var visibility: Double?
    var ozone: Double?
    var temperatureMin: Temperature?
    var temperatureMinTime: Int?
    var temperatureMax: Temperature?
    var temperatureMaxTime: Int?
    var apparentTemperatureMin: Temperature?
    var apparentTemperatureMinTime: Int?
    var apparentTemperatureMax: Temperature?
    var apparentTemperatureMaxTime: Int?
    
    
    init(jsonDict: [String: Any]) {
        
        self.time = (jsonDict["time"] as! Int)
        self.summary = (jsonDict["summary"] as! String)
        self.icon = jsonDict["icon"] as? String
        self.sunriseTime = jsonDict["sunriseTime"] as? Int
        self.sunsetTime = jsonDict["sunsetTime"] as? Int
        self.moonPhase = jsonDict["moonPhase"] as? Double
        self.precipIntensity = jsonDict["precipIntensity"] as? Double
        self.precipIntensityMax = jsonDict["precipIntensityMax"] as? Double
        self.precipIntensityMaxTime = jsonDict["precipIntensityMaxTime"] as? Int
        self.precipProbability = jsonDict["precipProbability"] as? Double
        self.precipType = jsonDict["precipType"] as? String
        self.dewPoint = jsonDict["dewPoint"] as? Double
        self.humidity = jsonDict["humidity"] as? Double
        self.pressure = jsonDict["pressure"] as? Double
        self.windSpeed = jsonDict["windSpeed"] as? Double
        self.windGust = jsonDict["windGust"] as? Double
        self.windGustTime = jsonDict["windGustTime"] as? Int
        self.windBearing = jsonDict["windBearing"] as? Int
        self.cloudCover = jsonDict["cloudCover"] as? Double
        self.uvIndex = jsonDict["uvIndex"] as? Int
        self.uvIndexTime = jsonDict["uvIndexTime"] as? Int
        self.visibility = jsonDict["visibility"] as? Double
        self.ozone = jsonDict["ozone"] as? Double
        if let temperatureMin = jsonDict["temperatureMin"] as? Double {
            self.temperatureMin = Temperature(degree: temperatureMin, type: .FAHRENHEIT)
        }
        self.temperatureMinTime = jsonDict["temperatureMinTime"] as? Int
        
        if let temperatureMax = jsonDict["temperatureMax"] as? Double {
            self.temperatureMax = Temperature(degree: temperatureMax, type: .FAHRENHEIT)
        }
        
        self.temperatureMaxTime = jsonDict["temperatureMaxTime"] as? Int
        
        if let apparentTemperatureMin = jsonDict["apparentTemperatureMin"] as? Double {
            self.apparentTemperatureMin = Temperature(degree: apparentTemperatureMin, type: .FAHRENHEIT)
        }
        
        self.apparentTemperatureMinTime = jsonDict["apparentTemperatureMinTime"] as? Int
        
        if let apparentTemperatureMax = jsonDict["apparentTemperatureMax"] as? Double {
        self.apparentTemperatureMax = Temperature(degree: apparentTemperatureMax, type: .FAHRENHEIT)
        }
        self.apparentTemperatureMaxTime = jsonDict["apparentTemperatureMaxTime"] as? Int
    }
}
