//
//  UIViewController+SubViews.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {

        // Add the view controller as a child
        addChild(child)

        // Move the child view controller's view to the parent's view
        view.addSubview(child.view)

        // Notify the child that it was moved to a parent
        didMove(toParent: self)
    }

    func remove() {
        guard let _ = self.parent else {
            return
        }
        

        // Notify the child that it's about to be moved away from its parent
        willMove(toParent: nil)

        // Remove the child
        removeFromParent()

        // Remove the child view controller's view from its parent
        view.removeFromSuperview()
    }
}
