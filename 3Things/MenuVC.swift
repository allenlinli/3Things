//
//  MenuVC.swift
//  3Things
//
//  Created by allenlinli on 5/5/16.
//  Copyright © 2016 Raccoonism. All rights reserved.
//

import UIKit

class MenuVC: UIViewController
{
    override func viewDidLoad()
    {
        let testLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        testLabel.text = "MENU"
        view.addSubview(testLabel)
    }
}
