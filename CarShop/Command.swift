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
    case remove = "remove"
    case exit = "exit"
    
    static let commands: [Command] = [.print, .add, .remove, .exit]
}
