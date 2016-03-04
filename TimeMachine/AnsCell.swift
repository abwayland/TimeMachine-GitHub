//
//  AnsCell.swift
//  TimeMachine
//
//  Created by Adam Wayland on 3/4/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import UIKit

class AnsCell: UITableViewCell {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
