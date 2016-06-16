//
//  MainVC.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController
{
//    let menuButton: UIButton?
    
    @IBOutlet weak var menuButton: UIButton!
    override func viewDidLoad() {
        view.backgroundColor = UIColor.brownColor()
        
//        menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44.0, height: 44.0))
//        view.addSubview(menuButton)
//        menuButton?.setBackgroundImage(UIImage(named:"Menu Button"), forState: UIControlState.Normal)
//        menuButton?.setBackgroundImage(UIImage(named:"Menu Button"), forState: UIControlState.Highlighted)
//        menuButton.addTarget(self, action: Selector("buttonOnClick"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    @IBAction func menuButtonPressed(sender: AnyObject)
    {
        print("buttonOnClick")
    }
}