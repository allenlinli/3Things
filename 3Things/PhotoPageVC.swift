//
//  PageVC.swift
//  3Things
//
//  Created by allenlinli on 5/11/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class PhotoPageVC: UIPageViewController {
//    weak var photoPageVC: PhotoPageVCDelegate?
    var photos = ["thing1", "thing2", "thing3"]
    var currentIndex: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let vc = getPhotoController(currentIndex) {
            let vcs = [vc]
            // 2
            setViewControllers(vcs,
                               direction: .Forward,
                               animated: false,
                               completion: nil)
        }
    }
    
    func getPhotoController(index: Int) -> PhotoVC? {
        let PhotoVCID = "PhotoVCID"
        if let storyboard = storyboard,
            pageVC = storyboard.instantiateViewControllerWithIdentifier(PhotoVCID) as? PhotoVC {
            pageVC.photoName = photos[index]
            pageVC.photoIndex = index
            return pageVC
        }
        return nil
    }
}


extension PhotoPageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        if let vc = viewController as? PhotoVC {
            var index = vc.photoIndex
            guard index != NSNotFound else { return nil }
            index = index - 1
            guard index != photos.count else {return nil}
            return getPhotoController(index)
        }
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        if let vc = viewController as? PhotoVC {
            var index = vc.photoIndex
            guard index != NSNotFound else { return nil }
            index = index + 1
            guard index != photos.count else {return nil}
            return getPhotoController(index)
        }
        return nil
    }
}