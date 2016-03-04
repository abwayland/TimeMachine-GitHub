//
//  MsgCell.swift
//  TimeMachine
//
//  Created by Adam Wayland on 2/29/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import UIKit


class MsgCell: UITableViewCell {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var balloonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
