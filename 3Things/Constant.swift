//
//  Constant.swift
//  3Things
//
//  Created by allenlinli on 8/7/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import Foundation

enum PhotoKey: String
{
    case Thing1 = "Thing1"
    case Thing2 = "Thing2"
    case Thing3 = "Thing3"
    
    static let allValues = [Thing1, Thing2, Thing3]
}

enum PhotoFileDataType: String
{
    case ViewControlerIndex = "ViewControlerIndex"
    case Photo = "Photo"
    case ViewControllerTitle = "VCTitle"
    
    static let allValues = [ViewControlerIndex, Photo, ViewControllerTitle]
}


