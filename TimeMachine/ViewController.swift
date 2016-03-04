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
        if introArray.count > 20 {
            introArray.removeFirst()
        }
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
//        for subview in cell.contentView.subviews {
//            subview.removeFromSuperview()
//        }
        let msg = introArray[indexPath.row]
        
//        let msgRect = CGRect(x: 0, y: 0, width: 0.75 * tableView.bounds.size.width, height: 0.75 * cell.bounds.size.height)
        
        cell.msgLabel.text = msg.message
        if msg.sender == "friend" {
            cell.msgLabel.textColor = UIColor.blackColor()
            cell.msgLabel.textAlignment = NSTextAlignment.Left
            cell.balloonView.backgroundColor = UIColor.lightGrayColor()
        } else {
            cell.msgLabel.textColor = UIColor.whiteColor()
            cell.msgLabel.textAlignment = NSTextAlignment.Right
            cell.balloonView.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 0.5)
        }
        
//        msgLabel.frame.origin.x = msg.sender == "friend" ? msgLabel.frame.origin.x + 10 : msgLabel.frame.origin.x - 10
        
        return cell
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introArray = [msg01,msg02,msg03]
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

