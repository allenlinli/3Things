//
//  AppDelegate.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor.darkGrayColor()
        pageControl.backgroundColor = UIColor.clearColor()
        
//        //create photo for 
//        if NSFileManager.defaultManager().fileExistsAtPath()
//        
//        // New Folder is your folder name
//        NSError *error = nil;
//        if (![[NSFileManager defaultManager] fileExistsAtPath:stringPath])
//        [[NSFileManager defaultManager] createDirectoryAtPath:stringPath withIntermediateDirectories:NO attributes:nil error:&error];
//        
//        NSString *fileName = [stringPath stringByAppendingFormat:@"/image.jpg"];
//        NSData *data = UIImageJPEGRepresentation(imageForShare, 1.0);
//        [data writeToFile:fileName atomically:YES];
        
        
        return true
    }
}

