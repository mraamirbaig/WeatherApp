//
//  Weather.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

struct Weather {
    
    var summary: String!
    var icon: String?
    var data = [WeatherData]()
    
    init(jsonDict: [String: Any]) {
        
        summary = (jsonDict["summary"] as! String)
        icon = jsonDict["icon"] as? String
        
        guard let weatherDataDictArray = jsonDict["data"] as? [[String: Any]], weatherDataDictArray.count > 0 else {
            return
        }
        var  weatherDataArray = [WeatherData]()
        for weatherDataDict in weatherDataDictArray {
            
            let weatherData = WeatherData(jsonDict: weatherDataDict)
            weatherDataArray.append(weatherData)
        }
        data = weatherDataArray
    }
}
