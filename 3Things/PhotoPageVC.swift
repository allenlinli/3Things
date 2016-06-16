//
//  PageVC.swift
//  3Things
//
//  Created by allenlinli on 5/11/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit
import SCPageViewController

class PhotoPageVC: UIViewController , SCPageViewControllerDataSource, SCPageViewControllerDelegate {
    
    
    
    let photoNames = ["thing1", "thing2", "thing3"]
//    var currentPageIndex: Int = 0
//        {
//        willSet {
//            print("willSet currentPageIndex:\(newValue)")
//            pageControl?.currentPage = newValue
//        }
//    }

//    var pagesCount: Int
//        {
//            get {
//                return photoNames.count
//            }
//        }
    
//    var pageControl: UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pageViewController.setLayouter(SCPageLayouter(), animated: true, completion: nil)
//        pageViewController.easingFunction = SCEasingFunction(type: SCEasingFunctionType.Linear)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        
        
//        var photoVCs = [PhotoVC]()
//        photoVCs.append(getPhotoController(currentPageIndex)!)
//        setViewControllers(photoVCs, direction: .Forward, animated: false, completion: nil)
        
//        pageControl = UIPageControl(frame: CGRect(x: 100, y: 100, width: 100.0, height: 37.0))
        
//        view.addSubview(pageControl!)
        
//        for view in self.view.subviews {
//            if let scroolView = view as? UIScrollView
//            {
//                scroolView.delegate = self
//            }
//        }
        
        
        
    }
    
//    func getPhotoController(index: Int) -> PhotoVC? {
//        if index < 0 || index == NSNotFound {
//            return nil
//        }
//        else if index >= pagesCount {
//            return nil
//        }
//        
//        let PhotoVCID = "PhotoVCID"
//        if let storyboard = storyboard,
//            pageVC = storyboard.instantiateViewControllerWithIdentifier(PhotoVCID) as? PhotoVC {
//            pageVC.photoName = photoNames[index]
//            pageVC.photoIndex = index
//            return pageVC
//        }
//        return nil
//    }
    
    override func viewDidLayoutSubviews() {
        let subviews: [UIView] = view.subviews
        for subView in subviews {
            if subView is UIScrollView
            {
                subView.frame = view.bounds
                break
            }
        }
        super.viewDidLayoutSubviews()
    }
}


//extension PhotoPageVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource
//{
//    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
//    {
//        print("before:\(currentPageIndex)")
//        if let photocVC = viewController as? PhotoVC
//        {
//            let index = photocVC.photoIndex
//            if (index == 0 || index == NSNotFound) {
//                return nil
//            }
//            currentPageIndex = index - 1
//        }
//        return getPhotoController(currentPageIndex)
//    }
//    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
//    {
//        print("after:\(currentPageIndex)")
//        if let photocVC = viewController as? PhotoVC
//        {
//            let index = photocVC.photoIndex
//            if (index == pagesCount - 1 || index == NSNotFound) {
//                return nil
//            }
//            currentPageIndex = index + 1
//        }
//        return getPhotoController(currentPageIndex)
//    }
//    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
//    {
//        return pagesCount
//    }
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
//    {
//        return currentPageIndex
//    }
//}

//extension PhotoPageVC: UIScrollViewDelegate
//{
//    func scrollViewDidScroll(scrollView: UIScrollView)
//    {
//        print(currentPageIndex)
//        if currentPageIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0)
//        }
//        else if currentPageIndex == pagesCount - 1 && scrollView.contentOffset.x > scrollView.bounds.size.width {
//            scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width, 0)
//        }
//    }

//    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
//    {
//        if currentPageIndex == 0 && scrollView.contentOffset.x < scrollView.bounds.size.width
//        {
//            targetContentOffset.memory = CGPointMake(scrollView.bounds.size.width, 0)
//        }
//        else if currentPageIndex == pagesCount - 1 && scrollView.contentOffset.x >= scrollView.bounds.size.width
//        {
//            targetContentOffset.memory = CGPointMake(scrollView.bounds.size.width, 0)
//        }
//    }
//}