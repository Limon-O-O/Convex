//
//  TabBarControllerConfig.swift
//  Example
//
//  Created by Limon on 3/19/16.
//  Copyright © 2016 Convex. All rights reserved.
//

import UIKit
import Convex

class TabBarControllerConfig: NSObject {

    let tabBarController: TabBarController

    override init() {

        let button = PlusCenterButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        button.setBackgroundImage(UIImage(named: "post_normal"), forState: .Normal)

        tabBarController = TabBarController(button: button)

        let dict1 = [Constant.TabbarItemsTitleKey: "首页", Constant.TabbarItemsImageKey: "home_normal", Constant.TabbarItemsSelectedImageKey: "home_highlight"]
        
        let dict2 = [Constant.TabbarItemsTitleKey: "设置", Constant.TabbarItemsImageKey: "message_normal", Constant.TabbarItemsSelectedImageKey: "message_highlight"]

        tabBarController.tabBarItemsAttributes = [dict1, dict2]

        let firstVC = ViewController()
        let secondVC = ViewController()
        secondVC.view.backgroundColor = UIColor.blueColor()
        
        tabBarController.viewControllers = [firstVC, secondVC]
    }
}


class BaseNavigationController: UINavigationController {
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = !viewControllers.isEmpty
        super.pushViewController(viewController, animated: animated)
    }
}
