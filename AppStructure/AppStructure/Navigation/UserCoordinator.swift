//
//  UserCoordinator.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit


class UsersCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
       self.navigationController = navigationController
    }
    
    func start() {
        let usersViewController: UsersViewController = UsersViewController()
        self.navigationController.viewControllers = [usersViewController]
    }
    
    
}
