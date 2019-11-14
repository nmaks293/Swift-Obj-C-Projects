//
//  Command.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

enum Command: String {
    case print = "print"
    case add = "add"
    case addAfter = "add after"
    case remove = "remove"
    case exit = "exit"
    
    static let commands: [Command] = [.print, .add, .remove, .exit, .addAfter]
    
    static func allCommands() -> String {
        var result: String = ""
        for command in self.commands {
            result += "'\(command.rawValue)' "
        }
        return result
    }
    
}
