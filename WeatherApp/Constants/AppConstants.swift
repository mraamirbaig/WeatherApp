//
//  AppConstants.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import Foundation

class AppConstants {
    
    
    static let DARKSKY_API_KEY = "da8f56f779904de9a5c008295f63713b"
    
    struct BaseUrls {
        
        static let ARTICLE_BASE_URL = "https://api.darksky.net/forecast"
    }
    
    enum TEMPERATURE_TYPE: String {
        
        case FAHRENHEIT = "Fahrenheit"
        case CELSIUS = "Celsius"
    }
}
