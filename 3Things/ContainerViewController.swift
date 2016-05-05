//
//  ContainerViewController.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import SlideMenuControllerSwift
import UIKit

class ContainerViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MainVCID") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("MenuVCID") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    
}
