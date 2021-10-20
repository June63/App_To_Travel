//
//  WeatherViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 13/10/2021.
//

import UIKit

class WeatherViewController: UIViewController {

    // Set the light status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: Outlets
    @IBOutlet weak var newYorkTemp: UILabel!
    @IBOutlet weak var newYorkDetail: UILabel!
    @IBOutlet weak var newYorkWeatherIcon: UIImageView!
    @IBOutlet weak var selectedCityTemp: UILabel!
    @IBOutlet weak var selectedCityDetail: UILabel!
    @IBOutlet weak var selectedCityWeatherIcon: UIImageView!
    @IBOutlet weak var citiesListButton: UIStackView!
    @IBOutlet weak var selectedCityLabel: UILabel!
    @IBOutlet weak var compareWeatherButton: DesignableButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // User default selected city
        selectedCityLabel.text = SettingService.city

        // Get weather
        getWeather()

        // Add gesture for citiesListButton StackView
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.showCityList(_:)))
        citiesListButton.addGestureRecognizer(tap)
    }

    // MARK: Action
    @IBAction func didTapWeatherButton(_ sender: Any) {
       getWeather()
    }

    /// Get weather from API
    private func getWeather() {
        // Hiding the button and show the loader
        compareWeatherButton.isHidden = true
        loader.isHidden = false

        // API call
        WeatherService.shared.getWeather { (success, weatherDetail) in
            // Hiding the loader and show the button
            self.compareWeatherButton.isHidden = false
            self.loader.isHidden = true

            if success {
                let weatherNY = weatherDetail!["newYork"]!
                let weather = weatherDetail!["selectedCity"]!
                var tempNY = weatherNY.main.temp
                var temp = weather.main.temp

                // Round the temp
                tempNY = Double(round(10*tempNY/10))
                temp = Double(round(10*temp/10))

                // Update UI
                self.newYorkTemp.text! = String(tempNY) + "°"
                self.newYorkDetail.text! = weatherNY.weather[0].description
                self.newYorkWeatherIcon.image = self.setImage(for: weatherNY.weather[0])
                self.selectedCityTemp.text! = String(temp) + "°"
                self.selectedCityDetail.text! = weather.weather[0].description
                self.selectedCityWeatherIcon.image = self.setImage(for: weather.weather[0])
            } else {
                self.alertWeatherFail()
            }
        }
    }

    // Show city list
    // swiftlint:disable all
    @objc private func showCityList(_ gesture: UIGestureRecognizer) {
        let sb = self.storyboard?.instantiateViewController(withIdentifier: "CityList")
        let vc = sb as! CityListViewController
        vc.delegate = self
        self.present(vc, animated: false)
    }

    // Set image for weather description
    private func setImage(for weatherElement: WeatherElement) -> UIImage {
        // Main weather description
        let main = weatherElement.main

        // Change image to match main description
        if main.contains("Clouds") {
            return #imageLiteral(resourceName: "icon-weather-cloud")
        } else if main.contains("Clear") {
            return #imageLiteral(resourceName: "icon-weather-sunny")
        } else if main.contains("Rain") {
            return #imageLiteral(resourceName: "icon-weather-cloudy-rainy")
        } else if main.contains("Thunderstorm") {
            return #imageLiteral(resourceName: "icon-weather-thunder")
        } else if main.contains("Snow") {
            return #imageLiteral(resourceName: "icon-weather-snow")
        } else if main.contains("Drizzle") {
            return #imageLiteral(resourceName: "icon-weather-drizzle")
        }

        // For all the rest
        return #imageLiteral(resourceName: "icon-weather-else")
    }
}

// Protocol
extension WeatherViewController: IsAbleToReceiveData {
    // Recieve Data from another VC
    func passCity(_ data: City) {
        // Uptade city and country name
        selectedCityLabel.text = data.name + ", " + data.country

        // Display the loader
        compareWeatherButton.isHidden = true
        loader.isHidden = false

        // Then automaticly update weather after QoL delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.getWeather()
        }
    }
}

// Alerts
extension WeatherViewController {
    // Alert for API fail
    private func alertWeatherFail() {
        let alertVC = UIAlertController(title: "Erreur réseau",
                                        message: "Vérifiez votre réseau et ressayez.",
                                        preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive)
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true)
    }
}

