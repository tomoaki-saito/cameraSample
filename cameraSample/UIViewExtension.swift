//
//  UIViewExtension.swift
//  bento_order
//
//  Created by tomoaki saito on 2015/06/16.
//  Copyright (c) 2015年 mikan. All rights reserved.
//

import UIKit

extension UIView {
    func addTopBorder(width: CGFloat, color: CGColor){
        var border = CALayer()
        border.borderColor = color
        border.frame = CGRect(x: 0, y: 0, width:  self.frame.size.width, height: width)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addButtomBorder(width: CGFloat, color: CGColor){
        var border = CALayer()
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setCornerRadius(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true;
    }
}

