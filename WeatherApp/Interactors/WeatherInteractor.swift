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
    
    func getDailyWeatherForeCast(completionHandler: @escaping (_ weather: Weather?) -> Void) {
        
        
        guard let url = URL(string: "https://api.darksky.net/forecast/b1b4beb010f9147963bd803fb9bbd9ae/24.4539,54.3773") else {
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
