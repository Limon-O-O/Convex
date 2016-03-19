//
//  PlusButton.swift
//  Example
//
//  Created by Limon on 3/19/16.
//  Copyright © 2016 Convex. All rights reserved.
//

import UIKit
import Convex

class PlusCenterButton: UIButton, PlusButton {
    var multiplerInCenterY: CGFloat = 0.2
    var indexOfPlusButtonInTabBar: Int = 1

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        setBackgroundImage(UIImage(named: "post_normal"), forState: .Normal)
        addTarget(self, action: #selector(PlusCenterButton.buttonAction), forControlEvents: .TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    dynamic private func buttonAction() {
        print("PlusButton is Clicked")
    }
}