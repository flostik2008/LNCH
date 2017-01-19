//
//  ChooseCategoryVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/13/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit


class ChooseCategoryVC: UIViewController {

    var meal = Meal(context: context)

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func breakfastChosen(_ sender: Any) {
        meal.category = "breakfast"
        performSegue(withIdentifier: "CreateMealVC", sender: meal)
    }
  
    @IBAction func lunchChosen(_ sender: Any) {
        meal.category = "lunch"
        performSegue(withIdentifier: "CreateMealVC", sender: meal)
    }
    
    @IBAction func dinnerChosen(_ sender: Any) {
        meal.category = "dinner"
        performSegue(withIdentifier: "CreateMealVC", sender: meal)

    }
    
    @IBAction func dessertChosen(_ sender: Any) {
        meal.category = "dessert"
        performSegue(withIdentifier: "CreateMealVC", sender: meal)
    }
    
    @IBAction func snackChosen(_ sender: Any) {
        meal.category = "snack"
        performSegue(withIdentifier: "CreateMealVC", sender: meal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CreateMealVC" {
            if let createMealVC = segue.destination as? CreateMealVC {
                if let mealk = sender as? Meal {
                    createMealVC.meal = mealk
                }
            }
        }
    }
    
    @IBAction func backToMainVCBtn(_ sender: Any) {
     
        dismiss(animated: true, completion: nil)
    }

}

