//
//  UIViewController+Extentions.swift
//  CoreSmart
//
//  Created by Philip on 1/18/20.
//  Copyright © 2020 Philip. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func scrollToTop() {
        func scrollToTop(view: UIView?) {
            guard let view = view else { return }

            switch view {
            case let scrollView as UIScrollView:
                guard scrollView.scrollsToTop == true else { return }
                                
                scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
                return
            default:
                break
            }

            for subView in view.subviews {
                scrollToTop(view: subView)
            }
        }

        scrollToTop(view: view)
    }

}
