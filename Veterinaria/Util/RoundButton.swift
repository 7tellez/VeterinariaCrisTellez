//
//  RoundButton.swift
//  Veterinaria
//
//  Created by Camilo Téllez on 2/24/20.
//  Copyright © 2020 celuweb. All rights reserved.
//


import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

