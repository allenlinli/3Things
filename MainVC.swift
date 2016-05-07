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
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPhotoAction))
        if let t = tapGestureRecognizer {
            view.addGestureRecognizer(t)
        }
        
        view.backgroundColor = UIColor.grayColor()
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func menuButtonPressed() {
        self.slideMenuController()?.openLeft()
    }
    
    func addPhotoAction() {
        print("addPhotoAction")
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Add New Photo", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Edit Photo", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
