//
//  CollectionCell.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/11/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var mealImg: UIImageView!
    @IBOutlet weak var mealTitleLbl: UILabel!
    
    func configureCell(meal: Meal) {
        mealTitleLbl.text = meal.title
        
    }
    
}
