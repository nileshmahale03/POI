//
//  ResultsTableCell.swift
//  POI
//
//  Created by Nilesh Mahale on 11/24/15.
//  Copyright © 2015 Code-Programming. All rights reserved.
//

import UIKit

class ResultsTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
