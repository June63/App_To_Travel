//
//  CurencyViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 13/10/2021.
//

import UIKit
import Foundation

class CurrencyViewController: UIViewController {
    
    // MARK: - Outlets
    


// MARK: - Keyboard

extension ExchangeFormViewController: UITextFieldDelegate {
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        amountTextField.resignFirstResponder()
    }
}

// MARK: - Validate

extension ExchangeFormViewController {
    
    @IBAction func tapConvertButton() {
        toggleActivityIndicator(shown: true,
                                activityIndicator: activityIndicator,
                                validateButton: convertButton)
        symbolSelected()
        getRate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInterfaceExchangeRate(label: convertedAmountLabel, textField: amountTextField, button: convertButton)
        currencyPickerView.isHidden = true
        getCurrency()
    }
    
    // MARK: - Methods
    
    /// get the currencies
    private func getCurrency() {
        currencyService.getCurrency { (success, symbols) in
            self.toggleActivityIndicator(shown: false,
                                         activityIndicator: self.activityIndicator,
                                         validateButton: self.convertButton)
            if success, let symbols = symbols {
                self.orderSymbolsByAlpha(symbols: symbols)
            } else {
                // display an error message
                self.presentAlert(message: "The symbol of currency download failed.")
            }
            self.currencyPickerView.isHidden = false
        }
    }
    
    /// get the symbol of the currency selected in the pickerView
    private func symbolSelected() {
        let currencyIndex = currencyPickerView.selectedRow(inComponent: 0)
        let currency = symbols[currencyIndex]
        self.symbolPicked = currency
    }
    
    /// Reorganize the list in alphabetical order
    private func orderSymbolsByAlpha(symbols: [String]) {
        let symbolA = symbols.filter({ Array($0)[0] == "A" })
        let symbolC = symbols.filter({ Array($0)[0] == "C" })
        let symbolE = symbols.filter({ Array($0)[0] == "E" })
        let symbolU = symbols.filter({ Array($0)[0] == "U" })
        let symbolByAlpha = symbolA + symbolC + symbolE + symbolU
        self.symbols = symbolByAlpha.sorted()
    }
    
    /// get the exchange rate with the symbol picked, calculate and display the result
    private func getRate() {
        currencyService.getRate(symbol: symbolPicked) { (success, rate) in
            self.toggleActivityIndicator(shown: false,
                                         activityIndicator: self.activityIndicator,
                                         validateButton: self.convertButton)
            if success, let rate = rate {
                print(rate)
                guard let amount = self.amountTextField?.text else { return }
                guard let doubleAmount = Double(amount) else { return }
                let convertedAmount = rate * doubleAmount
                let convertedAmountRoundToDecimal = convertedAmount.roundToDecimal(2)
                self.convertedAmountLabel.text = String(convertedAmountRoundToDecimal)
            } else {
                // display an error message
                self.presentAlert(message: "The exchange rate download failed.")
            }
        }
    }
}

// MARK: - PickerView

extension ExchangeFormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return symbols.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return symbols[row]
    }
}
