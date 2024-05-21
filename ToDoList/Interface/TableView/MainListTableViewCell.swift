//
//  MainListTableViewCell.swift
//  ToDoList
//
//  Created by Omer Keskin on 20.05.2024.
//

import UIKit

class MainListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerCellTF: UILabel!
    @IBOutlet weak var detailCellTF: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
