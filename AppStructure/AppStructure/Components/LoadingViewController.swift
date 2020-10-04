//
//  LoadingViewController.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    private lazy var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.color = .black
        view.addSubview(activityIndicator)
        view.backgroundColor = .white
        activityIndicator.center = view.center
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
    }
}
