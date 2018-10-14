//
//  ForecastListVC.swift
//  WeatherApp
//
//  Created by FAB on 10/13/18.
//  Copyright © 2018 Aamir Baig. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastListVC: UIViewController {
    
    var locationManager: CLLocationManager!
    
    @IBOutlet private weak var tempTypeSegControl: UISegmentedControl!
    @IBOutlet private weak var forecastListTableView: UITableView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    var weather: Weather? {
        didSet {
            if weather != nil {
                weatherDataArray = weather!.data
            }else { weatherDataArray = []}
            reloadView()
        }
    }
    
    private var weatherDataArray = [WeatherData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private func setUp() {
        
        forecastListTableView.register(UINib(nibName: "ForecastListCell", bundle: nil), forCellReuseIdentifier: "ForecastListCell")
        
        tempTypeSegControl.selectedSegmentIndex = 0
        
        self.locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func fetchWeatherForLocation(_ location: CLLocation) {
        
        let forecastListVCPresenter = ForecastListVCPresenter.init(forecastListVC: self)
        forecastListVCPresenter.fetchDailyWeatherForecastForLocation(location)
    }
    
    private func reloadView() {
        
        self.forecastListTableView.reloadData()
    }
    
    func startLoaderAnimation(_ start: Bool) {
        if start == true {
            loader.startAnimating()
        }else {
            loader.stopAnimating()
        }
    }
    
    func showFailureAlert() {
        
        let alert = UIAlertController(title: "Loading failed", message: "Failed to load weather. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Try Again", style: .default, handler: { (_) in
            self.startLoaderAnimation(true)
            self.locationManager.startUpdatingLocation()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getCurrentTempType() -> AppConstants.TEMPERATURE_TYPE {
        if tempTypeSegControl.selectedSegmentIndex == 0 {
            return AppConstants.TEMPERATURE_TYPE.FAHRENHEIT
        }else {
            return AppConstants.TEMPERATURE_TYPE.CELSIUS
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowForecastDetailSegue", let weatherData = sender as? WeatherData {
            let forecastDetailVC =  segue.destination as! ForecastDetailVC
            forecastDetailVC.weatherData = weatherData
        }
    }
    
    @IBAction func tempTypeValueChanged(_ sender: Any) {
        
        reloadView()
    }
}

extension ForecastListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastListCell", for: indexPath) as! ForecastListCell
         
        cell.setWeatherData(weatherDataArray[indexPath.row], showTemperatureType: getCurrentTempType())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "ShowForecastDetailSegue", sender: weatherDataArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ForecastListVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            startLoaderAnimation(false)
            locationManager.stopUpdatingLocation()
            fetchWeatherForLocation(location)
        }
    }
}
