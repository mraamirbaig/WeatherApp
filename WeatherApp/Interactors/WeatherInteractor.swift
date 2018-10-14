//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class WeatherInteractor {
    
    func getDailyWeatherForecastForLocation(_ location: CLLocation, completionHandler: @escaping (_ weather: Weather?) -> Void) {
        
        guard let url = URL(string:AppConstants.BaseUrls.DARKSKY_API_BASE_URL+AppConstants.DARKSKY_API_KEY+"/\(location.coordinate.latitude),\(location.coordinate.longitude)") else {
            completionHandler(nil)
            return
        }
        
        Alamofire.request(url, method: .get, parameters: ["exclude": "currently,hourly"]) .validate() .responseJSON { response in
            guard response.result.isSuccess else {
                completionHandler(nil)
                return
            }
            
            guard let jsonDict = response.result.value as? [String: Any], let dailyDict = jsonDict["daily"] as? [String: Any]  else {
                completionHandler(nil)
                return
            }
            completionHandler(Weather(jsonDict: dailyDict))
        }
    }
}
