//
//  UsersViewController.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, ActivityIndicatorProtocol {
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: UsersPresenter!
    var dataSource: UserDataSource!
    
    lazy var loadingViewController = {
        return LoadingViewController()
    }()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(frame: .zero)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupTableView()
        presenter = UsersPresenter(view: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewDidLoad()
    }


    
    private func setupTableView() {
        tableView.register(UserTableViewCell.self)
    }
}

extension UsersViewController: UsersViewDelegate {
    
    func showIndicator() {
        startLoading()
    }
    
    func hideIndicattor() {
        stopLoading()
    }
    
    func fetchDataSuccess() {
        
        dataSource = UserDataSource(presenter: presenter)

        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
    }
    
    func showError(error: String) {
        let label = UILabel()
        label.text = error
        tableView.backgroundView = label
    }
    
    
}
