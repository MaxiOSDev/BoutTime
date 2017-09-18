//
//  RoundButton.swift
//  Bout Time
//
//  Created by Max Ramirez on 9/6/17.
//  Copyright © 2017 MaxRamirez. All rights reserved.
//

import UIKit
@IBDesignable

// For round corners, as I used in project 2
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
