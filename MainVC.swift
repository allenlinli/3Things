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
import ImagePicker
import SCPageViewController

class MainVC: UIViewController
{

    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var containerView: UIView!
    
    let photosNames = ["Thing1", "Thing2", "Thing3"]
    
    var tapGestureRecognizer: UITapGestureRecognizer?
    
    var imagePickerController: ImagePickerController?
    
    var photoPageVC : SCPageViewController = SCPageViewController()
    var viewControllers = [UIViewController?]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge.None
        
        menuButton.addTarget(self, action: #selector(menuButtonPressed), forControlEvents: UIControlEvents.TouchUpInside)
        
        photoPageVC.setLayouter(SCPageLayouter(), animated: false, completion: nil)
//        photoPageVC.easingFunction = SCEasingFunction(type: SCEasingFunctionType.Linear)
        
        photoPageVC.dataSource = self
        photoPageVC.delegate = self
        
        
        for i in 0..<3
        {
            let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PhotoVCID") as! PhotoVC
            photoVC.photoName = photosNames[i]

            viewControllers.append(photoVC)
        }
        
        photoPageVC.reloadData()
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
        let addPhotoActionController = UIAlertController(title: "3Things", message: "What's the 3 most important things on your mind?", preferredStyle: UIAlertControllerStyle.ActionSheet)

        weak var wSelf = self

        addPhotoActionController.addAction(UIAlertAction(title: "Add Photo", style: UIAlertActionStyle.Default, handler:
        {
                (action: UIAlertAction!) -> Void in
                let lImagePickerController = ImagePickerController()
                wSelf?.imagePickerController = lImagePickerController
                lImagePickerController.delegate = wSelf
                lImagePickerController.imageLimit = 1
            wSelf?.presentViewController(lImagePickerController, animated: true, completion: nil )
        }))

        addPhotoActionController.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
        {
                (action: UIAlertAction!) -> Void in
            let deletePhotoActionController = UIAlertController(title: "Alert", message: "Are you sure to delete this photo?", preferredStyle: UIAlertControllerStyle.Alert)

            deletePhotoActionController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
            deletePhotoActionController.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
                {
                    (action: UIAlertAction!) -> Void in
                    let vc = wSelf?.viewControllers[Int(wSelf!.photoPageVC.currentPage)] as! PhotoVC
                    vc.deletePhoto()
                    
            }))
            wSelf!.presentViewController(deletePhotoActionController, animated: true, completion: nil)
        }))

        addPhotoActionController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil
            ))
        
        self.presentViewController(addPhotoActionController, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

extension MainVC: ImagePickerDelegate
{
    func wrapperDidPress(images: [UIImage])
    {
        
    }
    
    func doneButtonDidPress(images: [UIImage])
    {
        if let photo = images.first {
            let vc = viewControllers[Int(photoPageVC.currentPage)] as! PhotoVC
            vc.addPhoto(photo)
        }
        
        imagePickerController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    func cancelButtonDidPress()
    {
        
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
}

// MARK: Photo File Path methods
func getPhotoFilePathWith(photoName: String) -> String
{
    return (getDocumentsDirectory() as NSString).stringByAppendingPathComponent(photoName).stringByAppendingString(".png")
}


func getDocumentsDirectory() -> String
{
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}
