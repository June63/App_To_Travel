//
//  ViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 06/10/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Set the tab bar style
    TabBar.appearance().barTintColor = #colorLiteral(red: 0.09803921569, green: 0.5137254902, blue: 1, alpha: 1)
    UITabBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.5019607843, green: 0.7333333333, blue: 1, alpha: 1)
    UITabBar.appearance().shadowImage = UIImage()
    UITabBar.appearance().backgroundImage = UIImage()

}
