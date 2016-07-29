//
//  FiksuCalcTableCell.swift
//  Fiksu Calc
//
//  Created by donghoon bae on 2016. 7. 29..
//  Copyright © 2016년 Forethink. All rights reserved.
//

import UIKit

class FiksuCalcTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingicon:UIImageView!
    @IBOutlet weak var settinglabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
