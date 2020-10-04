//
//  UsersPresenter.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import Foundation

protocol UsersViewDelegate: class {
    func showIndicator()
    func hideIndicattor()
    func fetchDataSuccess()
    func showError(error: String)
}

protocol UserCellView {
    func displayFirstName(firstName: String)
    func displayLastName(lastName: String)
}
class UsersPresenter {
    private weak var view: UsersViewDelegate?
    private let interactor = UsersInteractor()
    private var users = [User]()
    
    init(view: UsersViewDelegate) {
        self.view = view
    }
 
    func viewDidLoad() {
       getUser()
    }
    
    func getUser() {
        view?.showIndicator()
        interactor.getUsers { [weak self] (users, error) in
            guard let self = self else {return}
            self.view?.hideIndicattor()
            if let users = users {
                self.users = users
              self.view?.fetchDataSuccess()
            } else {
                self.view?.showError(error: "SomeThing went wrong")
            }

        }
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
    
    func configure(cell: UserCellView, for index: Int) {
        let user = users[index]
        cell.displayFirstName(firstName: user.firstName ?? "")
        cell.displayLastName(lastName: user.lastName ?? "")
    }
}
