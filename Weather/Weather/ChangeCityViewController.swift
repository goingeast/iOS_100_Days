//
//  ChangeCityViewController.swift
//  Weather
//
//  Created by Haoru Zhao on 6/6/19.
//  Copyright © 2019 Haoru Zhao. All rights reserved.
//

import UIKit

protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}

class ChangeCityViewController : UIViewController {
    @IBOutlet weak var changeCityTextField: UITextField!
    var delegate: ChangeCityDelegate?
    
    @IBAction func getWeatherPressed(_ sender: Any) {
        let cityName = changeCityTextField.text!
        delegate?.userEnteredANewCityName(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
