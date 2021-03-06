//
//  StoryboardBridgeController.swift
//  Impala
//
//  Created by Ambas Chobsanti on 11/20/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

import UIKit

public class BifrostController: UINavigationController {
    
    @IBInspectable public var storyboardName: String? = nil {
        didSet {
            setNeedReloadViewController()
        }
    }
    
    @IBInspectable public var storyboardID: String? = nil {
        didSet {
            setNeedReloadViewController()
        }
    }
   
    // MARK: Private Methods
    
    private var needReloadViewController = false
    
    private func setNeedReloadViewController() {
        self.needReloadViewController = true
        scheduleForReloadViewController()
    }
    
    private func scheduleForReloadViewController() {
        if self.needReloadViewController {
                if let storyboardName = self.storyboardName {
                    let viewController = self.loadViewController(storyboardName, storyboardID: self.storyboardID)
                    if let viewController = viewController {
                        self.viewControllers = [viewController]
                    }
                } else {
                    self.viewControllers = []
                }
                self.needReloadViewController = false
        }
    }
    
    private func loadViewController(storyboardName: String, storyboardID: String?) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        var viewController: UIViewController?
        if let storyboardID = storyboardID {
            viewController = storyboard.instantiateViewControllerWithIdentifier(storyboardID)
        } else {
            viewController = storyboard.instantiateInitialViewController()
        }
        return viewController
    }
}