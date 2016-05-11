//
//  MainVC.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit
import ImagePicker

class MainVC: UIViewController
{

    @IBOutlet weak var menuButton: UIButton!
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    var photoPageVC: PhotoPageVC?
    
    override func viewDidLoad()
    {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPhotoAction))
        if let t = tapGestureRecognizer
        {
            view.addGestureRecognizer(t)
        }
        
        view.backgroundColor = UIColor.grayColor()
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let photoPageVC = segue.destinationViewController as? PhotoPageVC {
            self.photoPageVC = photoPageVC
//            pageVC?.tutorialDelegate = self
        }
    }
    
    func menuButtonPressed()
    {
        self.slideMenuController()?.openLeft()
    }
    
    func addPhotoAction()
    {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        weak var wSelf = self
        alert.addAction(UIAlertAction(title: "Add New Photo", style: UIAlertActionStyle.Default, handler:
            {
            (action: UIAlertAction!) -> Void in
            let imagePickerController = ImagePickerController()
            imagePickerController.delegate = wSelf
            imagePickerController.imageLimit = 1
            wSelf?.presentViewController(imagePickerController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Edit Photo", style: UIAlertActionStyle.Default, handler:
            {
            (action: UIAlertAction!) -> Void in
            
    
        }))
        alert.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
            {
            (action: UIAlertAction!) -> Void in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil
    ))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func useCamera() {
        
    }
}

extension MainVC: ImagePickerDelegate
{
    func wrapperDidPress(images: [UIImage])
    {
        
    }
    
    func doneButtonDidPress(images: [UIImage])
    {
        
    }
    
    func cancelButtonDidPress()
    {
        
    }
}

//extension PhotoPageVC: UIP {
//    
//    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
//                                    didUpdatePageCount count: Int) {
//        pageControl.numberOfPages = count
//    }
//    
//    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
//                                    didUpdatePageIndex index: Int) {
//        pageControl.currentPage = index
//    }
//    
//}
