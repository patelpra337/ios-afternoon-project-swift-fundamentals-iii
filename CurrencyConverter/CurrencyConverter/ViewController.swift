//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInput = fromCurrencyTextField.text else {
            return
        }
        
        guard let dollars = Double(userInput) else {
            return
        }
        
        let conversion = convert(dollars)
        toCurrencyTextField.text = "\(conversion)"
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected = false
        mxnButton.isSelected = true
        
        if cadButton.isSelected == true {
            currency = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected = true
        cadButton.isSelected = false
        
        if mxnButton.isSelected == true {
            currency = .mxn
            toCurrencyLabel.text = "Currency (MXN)"
        }
    }
    
    // MARK: - Helper Methods
    
    func convert(_ dollars: Double) -> Double {
        if currency == .cad {
            let conversion = 0.76 * dollars
            return conversion
        } else if currency == .mxn {
            let conversion = 0.052 * dollars
            return conversion
        } else {
            return 0
        }
    }
}

