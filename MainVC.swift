//
//  MainVC.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

/*
 Comment:
 
 - Create 3 ViewControllers first. Add them to 'viewControllers', and show them on 'photoPageVC'. When I need to add a photo, then I add a photo on that viewController.
 
 
 */

import UIKit
//import ImagePicker
import SCPageViewController

class MainVC: UIViewController
{
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    var photoPageVC : SCPageViewController = SCPageViewController()
    var viewControllers = [UIViewController?]()
    
    var willShowPageIndex: UInt! = 0
    
    var currentPhotoVC: PhotoVC
    {
        get
        {
            return viewControllers[Int(photoPageVC.currentPage)] as! PhotoVC
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        
        photoPageVC.setLayouter(SCPageLayouter(), animated: false, completion: nil)
        
        photoPageVC.dataSource = self
        photoPageVC.delegate = self
        
        for index in 0..<3
        {
            let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PhotoVCID") as! PhotoVC
            photoVC.photoVCIndex = index
            viewControllers.append(photoVC)
        }
        
        photoPageVC.reloadData()
        
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        titleTextField.delegate = self
        
        // FIXME:
        titleTextField.hidden = true
    }
    
    func dismissKeyboard() {
        titleTextField.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let photoPageVC = segue.destinationViewController as? SCPageViewController
        {
            self.photoPageVC = photoPageVC
            self.photoPageVC.reloadData()
        }
    }
    
    func menuButtonPressed()
    {
        self.slideMenuController()?.openLeft()
    }
    
    @IBAction func editButtonPressed(sender: UIBarButtonItem)
    {
        let photoVC = viewControllers[Int(photoPageVC.currentPage)] as! PhotoVC
        photoVC.editButtonPressed(sender)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

extension MainVC: UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        currentPhotoVC.title = textField.text
        titleTextField.endEditing(true)
        return true
    }
}

extension MainVC: SCPageViewControllerDataSource, SCPageViewControllerDelegate
{
    func numberOfPagesInPageViewController(pageViewController: SCPageViewController!) -> UInt
    {
        return UInt(viewControllers.count)
    }
    
    func pageViewController(pageViewController: SCPageViewController!, viewControllerForPageAtIndex pageIndex: UInt) -> UIViewController!
    {
        guard let viewController = viewControllers[Int(pageIndex)] else {
            return nil
        }
        
        return viewController
    }
    
    
    func pageViewController(pageViewController: SCPageViewController!, didHideViewController controller: UIViewController!, atIndex index: UInt)
    {
        if index != willShowPageIndex
        {
            pageControl.currentPage = Int(willShowPageIndex!)
        }
    }
    
    func pageViewController(pageViewController: SCPageViewController!, didShowViewController controller: UIViewController!, atIndex index: UInt)
    {
        willShowPageIndex = index
    }
}
