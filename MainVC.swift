//
//  MainVC.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        if let image = UIImage(named:"Menu Button") {
            menuButton.setBackgroundImage(image, forState: UIControlState.Normal)
            menuButton.setBackgroundImage(image, forState: UIControlState.Highlighted)
        }
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func menuButtonPressed() {
        self.slideMenuController()?.openLeft()
    }
}
