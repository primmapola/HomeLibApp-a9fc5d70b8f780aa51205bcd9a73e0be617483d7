//
//  UILabel.swift
//  HomeLibApp
//
//  Created by Grigory Don on 12.12.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, aligment: NSTextAlignment) {
        self.init()
        
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = aligment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
