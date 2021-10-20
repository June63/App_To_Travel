//
//  WeatherFromViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 20/10/2021.
//

import UIKit

class WeatherFormViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var updateWeatherButton: UIButton!
    @IBOutlet weak var cityAuversLabel: UILabel!
    @IBOutlet weak var temperatureAuversLabel: UILabel!
    @IBOutlet weak var conditionAuversLabel: UILabel!
    @IBOutlet weak var cityNYLabel: UILabel!
    @IBOutlet weak var temperatureNYLabel: UILabel!
    @IBOutlet weak var conditionNYLabel: UILabel!
    @IBOutlet var allLabels: [UILabel]!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

}


