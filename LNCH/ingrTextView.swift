//
//  ingrTextView.swift
//  LNCH
//
//  Created by Evgeny Vlasov on 1/15/17.
//  Copyright © 2017 Evgeny Vlasov. All rights reserved.
//

import UIKit

class ingrTextView: UITextView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 2        
        self.layer.borderColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0).cgColor
    }

    
}
