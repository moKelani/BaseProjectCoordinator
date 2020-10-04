//
//  UserTableViewCell.swift
//  AppStructure
//
//  Created by Mohamed Kelany on 6/26/20.
//  Copyright © 2020 Mohamed Kelany. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell, ReusableView, NibLoadableView, UserCellView {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .blue
    }
    
    func displayFirstName(firstName: String) {
        firstNameLabel.text = firstName
    }
    
    func displayLastName(lastName: String) {
        lastNameLabel.text = lastName
    }
    
}
