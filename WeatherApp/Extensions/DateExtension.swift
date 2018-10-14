//
//  DateExtension.swift
//  WeatherApp
//
//  Created by FAB on 10/14/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//
//"yyyy-MM-dd HH:mm:ss"
import Foundation

extension Date {
    
    func getStringWithDateFormatter(_ dateFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
}
