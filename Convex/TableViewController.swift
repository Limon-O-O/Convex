//
//  TableViewController.swift
//  Example
//
//  Created by Limon on 3/19/16.
//  Copyright © 2016 Convex. All rights reserved.
//

import UIKit

public struct Constant {
    public static let TabbarItemsTitleKey = "tabBarItemTitle"
    public static let TabbarItemsImageKey = "tabBarItemImage"
    public static let TabbarItemsSelectedImageKey = "tabBarItemSelectedImage"
}

public protocol PlusButton {
    var multiplerInCenterY: CGFloat { get set }
    var indexOfPlusButtonInTabBar: Int { get set }
}

public class TabBarController: UITabBarController {

    public var tabBarItemsAttributes: [[String: String]]?

    public override var viewControllers: [UIViewController]? {
        didSet {
            setViewControllers()
        }
    }

    public var rootWindow: UIWindow? {
        guard let window = UIApplication.sharedApplication().delegate?.window else {
            return nil
        }
        return window
    }

    static weak var plusButton: UIButton?
    static var tabbarItemsCount: Int = 0

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    public convenience init<T: UIButton where T: PlusButton>(button: T) {
        TabBarController.plusButton = button
        self.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        toolBarSetup()
    }

    /// 利用 KVC 把系统的 tabBar 类型改为自定义类型
    private func toolBarSetup() {
        setValue(TabBar(), forKey: "tabBar")
    }

    private func setViewControllers() {

        guard let unwrappedTabBarItemsAttributes = tabBarItemsAttributes, unwrappedViewControllers = viewControllers
                where !unwrappedTabBarItemsAttributes.isEmpty && !unwrappedViewControllers.isEmpty && unwrappedTabBarItemsAttributes.count == unwrappedViewControllers.count else {
                    return
        }

        self.viewControllers?.forEach {
            $0.willMoveToParentViewController(nil)
            $0.view.removeFromSuperview()
            $0.removeFromParentViewController()
        }

        TabBarController.tabbarItemsCount = unwrappedViewControllers.count

        for (index, viewController) in unwrappedViewControllers.enumerate() {

            guard let title = unwrappedTabBarItemsAttributes[index][Constant.TabbarItemsTitleKey], normalImageName = unwrappedTabBarItemsAttributes[index][Constant.TabbarItemsImageKey], selectedImageName = unwrappedTabBarItemsAttributes[index][Constant.TabbarItemsSelectedImageKey] else {
                return
            }

            addOneChildViewController(viewController, title: title, normalImageName: normalImageName, selectedImageName: selectedImageName)
        }
    }

    private func addOneChildViewController(viewController: UIViewController, title: String, normalImageName: String, selectedImageName: String) {

        viewController.tabBarItem.title = title
        let normalImage = UIImage(named: normalImageName)
        normalImage?.imageWithRenderingMode(.AlwaysOriginal)
        viewController.tabBarItem.image = normalImage
        let selectedImage = UIImage(named: selectedImageName)
        normalImage?.imageWithRenderingMode(.AlwaysOriginal)
        viewController.tabBarItem.image = selectedImage

        addChildViewController(viewController)
    }
}
