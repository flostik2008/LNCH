//
//  CreateMealVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/14/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class CreateMealVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ingridientsTextView: UITextView!
    @IBOutlet weak var directionsTextView: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let lightGreyColor = UIColor(red:0.46, green:0.46, blue:0.46, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.setValue(lightGreyColor, forKeyPath: "_placeholderLabel.textColor")
        
        ingridientsTextView.text = "ingridients"
        ingridientsTextView.textColor = lightGreyColor
        ingridientsTextView.delegate = self
        
        directionsTextView.text = "directions"
        directionsTextView.textColor = lightGreyColor
        directionsTextView.delegate = self
        
        scrollView.keyboardDismissMode = .interactive
        IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 55
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let titleUnderline = CALayer()
        let width = CGFloat(2.0)
        
        titleUnderline.borderColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0).cgColor
        titleUnderline.frame = CGRect(x: 0, y: titleTextField.frame.size.height - width, width:  titleTextField.frame.size.width, height: titleTextField.frame.size.height)
        
        titleUnderline.borderWidth = width
        titleTextField.layer.addSublayer(titleUnderline)
        titleTextField.layer.masksToBounds = true

    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if ingridientsTextView.textColor == lightGreyColor {
            ingridientsTextView.text = nil
            ingridientsTextView.textColor = UIColor.white
        }
        
        if directionsTextView.textColor == lightGreyColor {
            directionsTextView.text = nil
            directionsTextView.textColor = UIColor.white
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if ingridientsTextView.text.isEmpty {
            ingridientsTextView.text = "ingridients"
            ingridientsTextView.textColor = lightGreyColor
        }
        
        if directionsTextView.text.isEmpty {
            directionsTextView.text = "directions"
            directionsTextView.textColor = lightGreyColor
        }
    }
}






