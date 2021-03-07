//
//  ListTableViewCell.swift
//  ToDoList
//
//  Created by Grace Carroll on 3/7/21.
//

import UIKit

protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
    weak var delegate: ListTableViewCellDelegate?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
