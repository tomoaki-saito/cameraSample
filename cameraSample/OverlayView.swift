//
//  OverlayView.swift
//  cameraSample
//
//  Created by tomoaki saito on 2015/06/23.
//  Copyright (c) 2015年 mikan. All rights reserved.
//

import UIKit
import Foundation

class OverlayView: UIView {
    
    //MARK: Initialization
    class func instance() -> OverlayView {
        return UINib(nibName: "OverlayView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! OverlayView
    }
    
    override func awakeFromNib() {
        
    }
}
