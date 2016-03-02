//
//  ViewController.swift
//  TimeMachine
//
//  Created by Adam Wayland on 2/29/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBAction func buttonPressed(sender: UIButton) {
        let playerMsg = msg(sender: "player", message: (sender.titleLabel?.text!)!)
        introArray.append(playerMsg)
        tableView.reloadData()
        if tableView.contentSize.height > tableView.bounds.height {
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: tableView.numberOfRowsInSection(0) - 1, inSection: 0), atScrollPosition: .Bottom, animated: true)
        }
    }
    
    let msg01 = msg(sender: "friend", message: "Hello?")
    let msg02 = msg(sender: "friend", message: "You there?")
    let msg03 = msg(sender: "friend", message: "This is a really long message which is going to do what?")
    var introArray = [msg]()
    
    struct msg {
        var sender: String
        var message: String
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return introArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("msgCell") as! MsgCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let msg = introArray[indexPath.row]
        
//        let textSize = CGSize(width: 260, height: 1000)
//        let attributes = [NSFontAttributeName : UIFont.systemFontOfSize(14.0)]
//        let size = msg.message.boundingRectWithSize(textSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
//        
//        let padding: CGFloat = 10.0
//        cell.contentView.frame = CGRectMake(padding, padding * 2, size.width, size.height)
        
        let msgRect = CGRect(x: 0, y: 0, width: 0.75 * tableView.bounds.size.width, height: 0.75 * cell.bounds.size.height)
        let msgView = UIView(frame: msgRect)
        msgView.frame.origin.x = msg.sender == "friend" ? 0 : tableView.bounds.size.width / 4
        msgView.backgroundColor = msg.sender == "friend" ? UIColor.lightGrayColor() : UIColor.blueColor()
        cell.contentView.addSubview(msgView)
        
        let msgLabel = UILabel(frame: msgView.bounds)
        msgLabel.text = msg.message
        msgLabel.textColor = msg.sender == "friend" ? UIColor.blackColor() : UIColor.whiteColor()
        msgLabel.textAlignment = msg.sender == "friend" ? NSTextAlignment.Left : NSTextAlignment.Right
        msgLabel.frame.origin.x = msg.sender == "friend" ? msgLabel.frame.origin.x + 10 : msgLabel.frame.origin.x - 10
        msgLabel.numberOfLines = 0
        msgLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        msgView.addSubview(msgLabel)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MsgCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "msgCell")
        introArray = [msg01,msg02,msg03]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

