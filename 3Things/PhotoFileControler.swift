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
    
    func saveTitle(withIndex index: Int, title: String)
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Title, withIndex: index)
        do
        {
            try title.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding)
        }
        catch
        {
            assert(false, "! title.writeToFile")
        }
    }
    
    func loadTitle(withIndex index: Int) -> String?
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Title, withIndex: index)
        do
        {
            let title = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return title
        }
        catch
        {
            
        }

        return nil
    }
    
    func deleteTitle(withIndex index: Int)
    {
        let path = filePath(forPhotoFileType: PhotoFileDataType.Title, withIndex: index)
        let fileManager = NSFileManager.defaultManager()
        do {
            try fileManager.removeItemAtPath(path)
        }
        catch let error as NSError
        {
            assert(false,error.localizedDescription)
        }
    }
    
    func filePath(forPhotoFileType type: PhotoFileDataType, withIndex: Int) -> String
    {
        let fileName = type.rawValue.stringByAppendingString(String(withIndex))
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first
        return documentsDirectory!.stringByAppendingString(fileName)
    }
}