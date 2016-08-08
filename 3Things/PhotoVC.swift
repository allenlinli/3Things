//
//  PhotoVC.swift
//  3Things
//
//  Created by allenlinli on 5/11/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit
import ImagePicker

class PhotoVC: UIViewController
{
    @IBOutlet weak var introView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    var photoVCIndex: Int!
    var introLabel: UILabel?
    
    var imagePickerController: ImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //load photos
        let image = PhotoFileControler.sharedInstance.loadPhoto(withIndex: photoVCIndex)
        photoImageView.image = image
        
        self.title = PhotoFileControler.sharedInstance.loadTitle(withIndex: photoVCIndex)
        
        view.clipsToBounds = true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func addPhotoButtonPressed(sender: UIButton) {
        addPhoto()
    }
    
    func editButtonPressed(sender: AnyObject)
    {
        // create a UIAlertController
        let alert = UIAlertController(title: "3Things", message: "What's the 3 most important things on your mind?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        weak var wSelf = self
        alert.addAction(UIAlertAction(title: "Add Photo", style: UIAlertActionStyle.Default, handler:
            {
                (action: UIAlertAction!) -> Void in
                wSelf?.addPhoto()
        }))
        
        if photoImageView.image != nil
        {
            alert.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
                {
                    (action: UIAlertAction!) -> Void in
                    //alert user before delete a photo
                    let deletePhotoActionController = UIAlertController(title: "Alert", message: "Are you sure to delete this photo?", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    deletePhotoActionController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
                    deletePhotoActionController.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
                        {
                            // Delete photo
                            (action: UIAlertAction!) -> Void in
                            guard let lSelf = wSelf else
                            {
                                assertionFailure()
                                return
                            }
                            PhotoFileControler.sharedInstance.deletePhoto(withIndex: lSelf.photoVCIndex)
                            lSelf.photoImageView.image = nil
                    }))
                    wSelf!.presentViewController(deletePhotoActionController, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil
            ))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func addPhoto()
    {
        // choose photo
        let lImagePickerController = ImagePickerController()
        imagePickerController = lImagePickerController
        lImagePickerController.delegate = self
        lImagePickerController.imageLimit = 1
        presentViewController(lImagePickerController, animated: true, completion: nil )
    }
}

extension PhotoVC: ImagePickerDelegate
{
    func wrapperDidPress(images: [UIImage])
    {
        
    }
    
    func doneButtonDidPress(images: [UIImage])
    {
        // did add photo
        if let photo = images.first
        {
            // TODO: use block to asychronize adding photo. And do error handling by try catch, also.
            PhotoFileControler.sharedInstance.savePhoto(withIndex: photoVCIndex, photo: photo)
            photoImageView.image = photo
        }
        
        imagePickerController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    func cancelButtonDidPress()
    {
        
    }
}








