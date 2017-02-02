//
//  AppointmentTableViewCell.swift
//  CarServicingApp
//
//  Created by sai duth deekshit garimella on 09/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carnolabel: UILabel!
    
    @IBOutlet weak var carmodellabel: UILabel!
    
    @IBOutlet weak var statusfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
