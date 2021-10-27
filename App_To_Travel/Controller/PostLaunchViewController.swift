//
//  PostLaunchViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation
import UIKit

class PostLaunchViewController: UIViewController {

    // Set the light status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Outlets
    @IBOutlet weak var iconBaluchon: UIImageView!

    // swiftlint:disable all
    override func viewDidLoad() {
        super.viewDidLoad()

        // Animate icon resize
        UIView.animate(withDuration: 0.6, animations: {
            self.iconBaluchon.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.iconBaluchon.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.iconBaluchon.alpha = 0
            }) { succes in
                // Navigate to the CustomTabBarViewController
                guard succes else { return }

                let sb = self.storyboard?.instantiateViewController(withIdentifier: "TabBar")
                let vc = sb as! CustomTabBarViewController

                self.present(vc, animated: false)
            }
        }
    }
}


