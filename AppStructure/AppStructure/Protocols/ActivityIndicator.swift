//
//  ActivityIndicator.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

protocol ActivityIndicatorProtocol {
    var activityIndicator: UIActivityIndicatorView { get }
}

extension ActivityIndicatorProtocol where Self: UIViewController {
    func startLoading() {
        view.addSubview(activityIndicator)
        activityIndicator.autoPinEdges(to: view)
        activityIndicator.startAnimating()
        view.bringSubviewToFront(activityIndicator)
    }
    
    func stopLoading() {
        activityIndicator.removeFromSuperview()
    }
}

