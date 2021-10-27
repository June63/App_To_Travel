//
//  TranslatorViewController.swift
//  App_To_Travel
//
//  Created by Léa Kieffer on 27/10/2021.
//

import Foundation
import UIKit

class TranslatorViewController: UIViewController {

    // Set the light status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var translatorButton: UIButton!
    @IBOutlet weak var topView: UIStackView!
    @IBOutlet weak var targetTextView: UITextView!
    @IBOutlet weak var separatorView: UIImageView!
    @IBOutlet weak var bottomView: UIStackView!
    @IBOutlet weak var sourceTextView: UITextView!
    @IBOutlet weak var loader: UIActivityIndicatorView!

    // MARK: Action
    @IBAction func didTapTranslatorButton(_ sender: Any) {
        guard sourceTextView.text != "Tapez ici" else {
            return
        }

        getTranslation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the translate.quote
        Translate.shared.quote = sourceTextView.text
        targetTextView.text = Translate.shared.translatedQuote

        // Set placeholders and tint color
        setPlaceholders()
        sourceTextView.tintColor = .white
    }

    /// Get translation from API
    private func getTranslation() {
        // Hide button and show loader
        loader.isHidden = false
        translatorButton.isHidden = true

        // API call
        TranslateService.shared.getTranslation { (success, stringToDecode) in
            // Hide loader and show button
            self.loader.isHidden = true
            self.translatorButton.isHidden = false

            if success {
                self.targetTextView.text = self.decodeString(stringToDecode!)
            } else {
                self.alertTranslationFail()
            }
        }
    }

    /// Decode a string with utf8
    ///
    /// - Parameter string: Translation quote from google API
    /// - Returns: Quote supporting special characters, can be nil
    private func decodeString(_ stringToDecode: String) -> String? {
        // Set options
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        // set Data
        guard let stringData = stringToDecode.data(using: .utf8) else {
            return nil
        }

        // Decode the string with data and options
        guard let attributedString = try? NSAttributedString(data: stringData,
                                                             options: options,
                                                             documentAttributes: nil) else {
            return nil
        }

        // Return the quote with special characters support
        return attributedString.string
    }
}

// UITexteView
extension TranslatorViewController: UITextViewDelegate {

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        // Animations of headerView, scrollView and converterButton
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 200)
            self.translatorButton.transform = CGAffineTransform(translationX: 0, y: 200)
            self.loader.transform = CGAffineTransform(translationX: 0, y: 200)
            self.headerView.alpha = 0
            self.topView.alpha = 0
            self.separatorView.alpha = 0
        }

        // Add gesture for dismiss the keyboard when tapping outside the UITextField
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard(_:)))
        self.view.addGestureRecognizer(tap)

        if sourceTextView.text == "Tapez ici" {
            sourceTextView.alpha = 1
            sourceTextView.text = ""
        }

        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // When the return key is taped
        if text == "\n" {
            if sourceTextView.text == "" {
                textView.resignFirstResponder()
                resetUI()
                setPlaceholders()
                targetTextView.text = ""
            } else {
                textView.resignFirstResponder()
                resetUI()
                Translate.shared.quote = textView.text
                getTranslation()
            }
            return false
        }
        return true
    }

    // Hiding keyboard
    @objc private func hideKeyboard(_ gesture: UITapGestureRecognizer) {

        sourceTextView.resignFirstResponder()
        resetUI()

        if sourceTextView.text == "" {
            setPlaceholders()
            targetTextView.text = ""
        } else {
            Translate.shared.quote = sourceTextView.text
            getTranslation()
        }
    }

    // Replace the UI elements at their original places
    private func resetUI() {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
            self.headerView.alpha = 1
            self.topView.alpha = 1
            self.separatorView.alpha = 1
        }
    }

    // Set the UITextView placeholders style
    private func setPlaceholders() {
        // Set the placeholder
        sourceTextView.text = "Tapez ici"
        // Set the textfield opacity
        sourceTextView.alpha = 0.3
    }
}

// Alerts
extension TranslatorViewController {
    // Alert for API fail
    private func alertTranslationFail() {
        let alertVC = UIAlertController(title: "Erreur réseau",
                                        message: "Vérifiez votre réseau et ressayez.",
                                        preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .destructive)
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true)
    }
}
