//
//  Coordinator.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/25/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

public protocol Coordinator : class {

    var childCoordinators: [Coordinator] { get set }

    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)

    func start()
}
