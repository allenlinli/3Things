//
//  PhotoFileControler.swift
//  3Things
//
//  Created by allenlinli on 8/7/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class PhotoFileControler
{
    static let sharedInstance = PhotoFileControler()
    private init() { }
    
    func savePhoto(withIndex index: Int, photo: UIImage)
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Photo, withIndex: index)
        let isWriteFileSuccess = UIImagePNGRepresentation(photo)?.writeToFile(path, atomically: true) ?? false
        assert(isWriteFileSuccess, "! isWriteFileSuccess")
    }
    
    func loadPhoto(withIndex index: Int) -> UIImage?
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Photo, withIndex: index)
        let image = UIImage(contentsOfFile: path)
        return image
    }
    
    func deletePhoto(withIndex index: Int)
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Photo, withIndex: index)
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.removeItemAtPath(path)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }   
    }
    
    func filePath(forPhotoFileType type: PhotoFileDataType, withIndex: Int) -> String
    {
        let fileName = type.rawValue.stringByAppendingString(String(withIndex))
        let pathsArray = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = pathsArray[0] as NSString
        return documentsDirectory.stringByAppendingString(fileName)
    }
}