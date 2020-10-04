//
//  UserDataSource.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit


class UserDataSource: NSObject, UITableViewDataSource, UITableViewDelegate  {
    
    private weak var presenter: UsersPresenter!
    
    init(presenter: UsersPresenter?) {
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(UserTableViewCell.self, for: indexPath)
        presenter?.configure(cell: cell, for: indexPath.row)
        return cell
    }
}
