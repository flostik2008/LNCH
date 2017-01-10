//
//  MealsVC.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/8/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class MealsVC: UIViewController {

    let width: CGFloat = 420
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: width, height: scrollView.frame.size.height)
       
    }

    @IBAction func allMealsBtn(_ sender: Any) {
    }
    @IBAction func breakfastMealsBtn(_ sender: Any) {
    }
    @IBAction func lunchBtn(_ sender: Any) {
    }
    @IBAction func dinnerBtn(_ sender: Any) {
    }
    @IBAction func desertBtn(_ sender: Any) {
    }
    
    @IBAction func snackBtn(_ sender: Any) {
    }
    
    
}









