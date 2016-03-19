//
//  TabBar.swift
//  Example
//
//  Created by Limon on 3/19/16.
//  Copyright © 2016 Convex. All rights reserved.
//

import UIKit

class TabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)

        if let upwrappedPlusButton = TabBarController.plusButton {
            addSubview(upwrappedPlusButton)
        }

        backgroundImage = getImageWithColor(UIColor.whiteColor())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let unwrappedPlusButton = TabBarController.plusButton where TabBarController.plusButton is protocol<PlusButton> else { return }

        let barWidth = frame.size.width
        let barHeight: CGFloat = frame.size.height

        let barButtonWidth: CGFloat = barWidth / CGFloat(TabBarController.tabbarItemsCount + 1)
        var multiplerInCenterY: CGFloat = 0.0
        var buttonIndex: Int = 0

        multiplerInCenterY = (unwrappedPlusButton as! PlusButton).multiplerInCenterY

        unwrappedPlusButton.center = CGPoint(x: barWidth * 0.5, y: barHeight * multiplerInCenterY)

        let plusButtonIndex = (unwrappedPlusButton as! PlusButton).indexOfPlusButtonInTabBar

        unwrappedPlusButton.frame = CGRect(x: CGFloat(plusButtonIndex) * barButtonWidth, y: CGRectGetMinY(unwrappedPlusButton.frame), width: CGRectGetWidth(unwrappedPlusButton.frame), height: CGRectGetHeight(unwrappedPlusButton.frame))

        let sortedSubviews = subviews.sort { (view1, view2) -> Bool in
            return view1.frame.origin.x < view2.frame.origin.x
        }

        // 调整加号按钮后面的 UITabBarItem 的位置
        sortedSubviews.forEach { childView in

            guard "\(childView.dynamicType)" == "UITabBarButton" else { return }

            if buttonIndex == plusButtonIndex {
                buttonIndex += 1
            }

            childView.frame = CGRect(x: CGFloat(buttonIndex) * barButtonWidth, y: CGRectGetMinY(childView.frame), width: barButtonWidth, height: CGRectGetHeight(childView.frame))

            buttonIndex += 1
        }

        bringSubviewToFront(unwrappedPlusButton)
    }

    // Capturing touches on a subview outside the frame of its superview
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {

        if !clipsToBounds && !hidden && alpha > 0.0 {

            if let result = super.hitTest(point, withEvent: event) {
                return result

            } else {
                for (_, subview) in subviews.reverse().enumerate() {
                    let subPoint = subview.convertPoint(point, fromView: self)
                    return subview.hitTest(subPoint, withEvent: event)
                }
            }
        }

        return nil
    }

    private func getImageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(origin: CGPointZero, size: CGSize(width: 1, height: 1))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
