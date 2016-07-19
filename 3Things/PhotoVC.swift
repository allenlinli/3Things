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
    var photoName: String!
    var introLabel: UILabel?
    
    var imagePickerController: ImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
        let addPhotoActionController = UIAlertController(title: "3Things", message: "What's the 3 most important things on your mind?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        weak var wSelf = self
        
        addPhotoActionController.addAction(UIAlertAction(title: "Add Photo", style: UIAlertActionStyle.Default, handler:
            {
                (action: UIAlertAction!) -> Void in
                wSelf?.addPhoto()
        }))
        
        if photoImageView.image != nil
        {
            addPhotoActionController.addAction(UIAlertAction(title: "Delete Photo", style: UIAlertActionStyle.Destructive, handler:
                {
                    (action: UIAlertAction!) -> Void in
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
                            let photoFilePath = getPhotoFilePathWith(lSelf.photoName)
                            let fileManager = NSFileManager.defaultManager()
                            do {
                                wSelf?.photoImageView.image = nil
                                try fileManager.removeItemAtPath(photoFilePath)
                            }
                            catch let error as NSError {
                                print("Ooops! Something went wrong: \(error)")
                            }
                    }))
                    wSelf!.presentViewController(deletePhotoActionController, animated: true, completion: nil)
            }))
        }
        
        addPhotoActionController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil
            ))
        
        self.presentViewController(addPhotoActionController, animated: true, completion: nil)
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
        if let photo = images.first {
            if let data = UIImagePNGRepresentation(photo)
            {
                let filePath = getPhotoFilePathWith(photoName!)
                data.writeToFile(filePath, atomically: true)
                photoImageView.image = photo
            }
        }
        
        imagePickerController?.dismissViewControllerAnimated(true, completion:nil)
    }
    
    func cancelButtonDidPress()
    {
        
    }
}

// MARK: Photo File Path methods
func getPhotoFilePathWith(photoName: String) -> String
{
    return (getDocumentsDirectory() as NSString).stringByAppendingPathComponent(photoName).stringByAppendingString(".png")
}