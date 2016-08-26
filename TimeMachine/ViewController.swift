//
//  ViewController.swift
//  TimeMachine
//
//  Created by Adam Wayland on 2/29/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var game: Game?

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func buttonPressed(sender: UIButton) {
        let playerChoice = sender.titleLabel?.text!
        if game != nil {
            game!.processInput(playerChoice!)
        }
        //let playerMsg = Msg(sender: "player", message: playerChoice!)
        //msgArr[msgArr.count - 1] = playerMsg
//        if msgArr.count > 20 {
//            msgArr.removeFirst()
//        }
        tableView.reloadData()
        if tableView.contentSize.height > tableView.bounds.height {
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: tableView.numberOfRowsInSection(0) - 1, inSection: 0), atScrollPosition: .Bottom, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let msg = msgArr[indexPath.row]
        if let msgChoices = msg.getChoices() {
            let cell = tableView.dequeueReusableCellWithIdentifier("ansCell") as! AnsCell
            cell.buttonA.setTitle(msgChoices[0], forState: .Normal)
            cell.buttonB.setTitle(msgChoices[1], forState: .Normal)
            cell.buttonC.setTitle(msgChoices[2], forState: .Normal)
            cell.buttonD.setTitle(msgChoices[3], forState: .Normal)
            
            return cell
        } else {
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
        }
        
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
        configureTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame()
    {
        if game == nil
        {
            game = Game()
        }
    }
    
}

