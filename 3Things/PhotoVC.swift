//
//  PhotoVC.swift
//  3Things
//
//  Created by allenlinli on 5/11/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {

    
    @IBOutlet weak var introView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addThingButton: UIButton!
    var photoName: String?
    var introLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.clipsToBounds = true
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func addPhoto(photo: UIImage?) {
        if let photo = photo, data = UIImagePNGRepresentation(photo)
        {
            let filePath = getPhotoFilePathWith(photoName!)
            data.writeToFile(filePath, atomically: true)
            photoImageView.image = photo
        }
    }
    
    func deletePhoto() {
        let photoFilePath = getPhotoFilePathWith(photoName!)
        let fileManager = NSFileManager.defaultManager()
        do {
            photoImageView.image = nil
            try fileManager.removeItemAtPath(photoFilePath)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
}