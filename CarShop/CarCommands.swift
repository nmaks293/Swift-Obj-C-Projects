//
//  CarCommands.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

enum  CarCommands: String {
    case characteristic = "char"
    case id = "id"
    
    static let commands: [CarCommands] = [.id, .characteristic]
    
    
    
    static func allCommands() -> String {
        var result: String = ""
        for command in self.commands {
            result += "'\(command.rawValue)' "
        }
        return result
    }
    
}
