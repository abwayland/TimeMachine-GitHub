//
//  Game.swift
//  TimeMachine
//
//  Created by Adam Wayland on 8/22/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import Foundation

var msgArr = [Msg]()

class Msg {
    
    var sender: String
    var message: String
    var choices: [String]?
    
    init(sender: String, message: String)
    {
        self.sender = sender
        self.message = message
    }
    
    func addChoices(choices: [String])
    {
        self.choices = ["None", "None", "None", "None"]
        for i in 0..<choices.count {
            self.choices![i] = choices[i]
        }
    }
    
    func getChoices() -> [String]?
    {
        return self.choices
    }

}

class Game {
    
    var currRoom: Room
    var roomArr: [Room] = []
    
    init() {
        let foyer = Room(name: "Foyer")
        let livingRoom = Room(name: "Living Room")
        let hall = Room(name: "Hall")
        foyer.addExit(Direction.north, room: livingRoom)
        livingRoom.addExit(Direction.south, room: foyer)
        livingRoom.addExit(Direction.west, room: hall)
        hall.addExit(Direction.east, room: livingRoom)
        roomArr.append(foyer)
        roomArr.append(livingRoom)
        roomArr.append(hall)
        currRoom = roomArr[0]
        gameLoop()
    }
    
    func gameLoop()
    {
        let msg1 = Msg(sender: "friend", message: currRoom.message)
        let msg2 = Msg(sender: "player", message: "nothing")
        let currChoices = currRoom.getCurrentChoices()
        msg2.addChoices(currChoices)
        msgArr.append(msg1)
        msgArr.append(msg2)
    }
    
    func processInput(input: String)
    {
        switch input {
        case "North" :
            if(currRoom.exitTo(Direction.north) != nil) {
                currRoom = currRoom.exitTo(Direction.north)!
            } else { print("Error in processInput - North") }
        case "South":
            if(currRoom.exitTo(Direction.south) != nil) {
                currRoom = currRoom.exitTo(Direction.south)!
            } else { print("Error in processInput - South") }
        case "West":
            if(currRoom.exitTo(Direction.west) != nil) {
                currRoom = currRoom.exitTo(Direction.west)!
            } else { print("Error in processInput - East") }
        case "East":
            if(currRoom.exitTo(Direction.east) != nil) {
                currRoom = currRoom.exitTo(Direction.east)!
            } else { print("Error in processInput - West") }
        default:
            print("Error in processInput")
        }
        gameLoop()
    }
    
}