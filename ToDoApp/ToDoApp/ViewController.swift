//
//  ViewController.swift
//  ToDoApp
//
//  Created by Yassine Lamtalaa on 5/19/25.
//
//  This is ToDoApp with FirebaseAnalytics integration to track user interactions.

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent(AnalyticsEventScreenView,
                               parameters: [AnalyticsParameterScreenName: "MainScreen",
                                            AnalyticsParameterScreenClass: "ViewController"])
    }

    @IBAction func enterDataButtonTapped(_ sender: Any) {
        Analytics.logEvent("enter_data_button_tapped", parameters: nil)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "EnterDataViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func lookUpDataTapped(_ sender: Any) {
        Analytics.logEvent("lookup_data_button_tapped", parameters: nil)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LookUpDataViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

