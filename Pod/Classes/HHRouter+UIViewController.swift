//
//  HHRouter+UIViewController.swift
//  Impala
//
//  Created by Ambas Chobsanti on 1/10/16.
//  Copyright © 2016 AM. All rights reserved.
//

import HHRouter

extension HHRouter {
    func viewControllerForPath(path: String) -> UIViewController {
        let viewController = HHRouter.shared().callBlock(path)
        guard let _viewController = viewController as? UIViewController else {
            assertionFailure("Wrong path for any viewController")
            return UIViewController()
        }
        return _viewController
    }
}