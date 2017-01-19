//
//  CreateMealVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/14/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class CreateMealVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var meal = Meal(context: context)
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ingridientsTextView: UITextView!
    @IBOutlet weak var directionsTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let lightGreyColor = UIColor(red:0.46, green:0.46, blue:0.46, alpha:1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        titleTextField.setValue(lightGreyColor, forKeyPath: "_placeholderLabel.textColor")
        
        ingridientsTextView.text = "ingridients"
        ingridientsTextView.textColor = lightGreyColor
        ingridientsTextView.delegate = self
        
        directionsTextView.text = "directions"
        directionsTextView.textColor = lightGreyColor
        directionsTextView.delegate = self
        
        scrollView.keyboardDismissMode = .interactive
        IQKeyboardManager.sharedManager().keyboardDistanceFromTextField = 55
        
        print("Zhenya: meal was passed \(meal)")
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            addImage.image = image
            
            // save image to directory. Assign that link meal.image
                
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func addImageBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Choose Source Of Image:", message: nil, preferredStyle: .actionSheet)
        
        let takePicAction = UIAlertAction(title: "Take A Photo", style: .default) { (action) in
            
            let picker = UIImagePickerController()
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
                picker.sourceType = UIImagePickerControllerSourceType.camera
                picker.delegate = self
                picker.allowsEditing = false
                self.present(picker, animated: true, completion: nil)
            }
            else {
                print("Coudn't open the camera")
            }
        }
        alertController.addAction(takePicAction)
        
        let choosePicAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        alertController.addAction(choosePicAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        if let title = titleTextField.text {
            meal.title = title
        }
    
        if let ingridients = ingridientsTextView.text {
            meal.ingridients = ingridients
        }
        
        if let directions = directionsTextView.text {
            meal.directions = directions
        }
        
        ad.saveContext()
        
        performSegue(withIdentifier: "backToMainVC", sender: nil)
    }
}






