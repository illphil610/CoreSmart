//
//  TabBarViewController.swift
//  CoreSmart
//
//  Created by Philip on 1/18/20.
//  Copyright © 2020 Philip. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: Properties
    
    var tabPressCount = 0
    
    enum CurrentAvailableViewControllers {
        case homeViewController
        case factsViewController
        case cameraViewController
        case membershipPlansViewController
        case moreViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        switch tabBarController.selectedIndex {
        case 0:
            guard tabPressCount == 0 else {
                if let vc = viewController as? HomeViewController { vc.scrollToTop() }
                tabPressCount = 0
                return
            }
            tabPressCount += 1
        
        case 1:
            guard tabPressCount == 0 else {
                if let vc = viewController as? MembershipPlansViewController { vc.scrollToTop() }
                tabPressCount = 0
                return
            }
            tabPressCount += 1
        
//        case 2:
//            if let vc = viewController as? CameraViewController { vc.setupCamera(); return }
        
        case 2:
            guard tabPressCount == 0 else {
                if let vc = viewController as? FactsViewController { vc.scrollToTop() }
                tabPressCount = 0
                return
            }
            tabPressCount += 1
        default: return
        }
    }
    
}



