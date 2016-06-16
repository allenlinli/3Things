//
//  PhotoVC.swift
//  3Things
//
//  Created by allenlinli on 5/11/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class PhotoVC: UIViewController {

    
    @IBOutlet weak var photoImageView: UIImageView!
    var photoName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let photoFilePath = getPhotoFilePathWith(photoName!)
        photoImageView.image = UIImage(contentsOfFile: photoFilePath) ?? nil
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