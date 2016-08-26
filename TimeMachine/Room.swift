//
//  Room.swift
//  TimeMachine
//
//  Created by Adam Wayland on 8/21/16.
//  Copyright © 2016 Adam Wayland. All rights reserved.
//

import Foundation

enum Direction {
    case north, south, east, west
}

class Room {
    
    var name: String
    var exits: [Direction:Room]
    var message: String
    
    init(name: String) {
        self.name = name
        self.exits = [:]
        self.message = "I'm in the " + self.name + "."
    }
    
    func addExit(direction: Direction, room: Room) {
        exits[direction] = room
    }
    
    func getName() -> String {
        return self.name
    }
    
    func exitTo(direction: Direction) -> Room?
    {
        return exits[direction]
    }
    
    func getCurrentChoices() -> [String]
    {
        var choiceArr = [String]()
        for exit in exits.keys {
            switch exit {
            case Direction.north:
                choiceArr.append("North")
            case Direction.south:
                choiceArr.append("South")
            case Direction.east:
                choiceArr.append("East")
            case Direction.west:
                choiceArr.append("West")
            }
        }
        return choiceArr
    }
    
}
