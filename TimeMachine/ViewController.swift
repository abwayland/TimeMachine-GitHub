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
        let playerMsg = msg(sender: "player", message: (sender.titleLabel?.text!)!, ans: false, ansArr: nil)
        introArray.append(playerMsg)
        if introArray.count > 20 {
            introArray.removeFirst()
        }
        tableView.reloadData()
        if tableView.contentSize.height > tableView.bounds.height {
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: tableView.numberOfRowsInSection(0) - 1, inSection: 0), atScrollPosition: .Bottom, animated: true)
        }
    }
    
    let msg01 = msg(sender: "friend", message: "Hello?", ans: false, ansArr: nil)
    let msg02 = msg(sender: "friend", message: "You there?", ans: false,    ansArr: nil)
    let msg03 = msg(sender: "friend", message: "This is a really long message which is going to do what?", ans: false, ansArr: nil)
    let msg04 = msg(sender: "player", message: "Blah.", ans: true, ansArr: ["Hello","Who are you?","What is your name?","Go North"])
    
    var introArray = [msg]()
    
    struct msg {
        var sender: String
        var message: String
        var ans: Bool
        var ansArr: [String]?
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return introArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let msg = introArray[indexPath.row]
        
        if msg.ans == false {
            let cell = tableView.dequeueReusableCellWithIdentifier("msgCell") as! MsgCell
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
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("ansCell") as! AnsCell
            cell.buttonA.setTitle(msg.ansArr![0], forState: .Normal)
            cell.buttonB.setTitle(msg.ansArr![1], forState: .Normal)
            cell.buttonC.setTitle(msg.ansArr![2], forState: .Normal)
            cell.buttonD.setTitle(msg.ansArr![3], forState: .Normal)
            return cell
        }
        
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introArray = [msg01,msg02,msg03,msg04]
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

