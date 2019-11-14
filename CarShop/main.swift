//
//  main.swift
//  CarShop
//
//  Created by Никита Максаковский on 22.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

let storage = Storage()

storage.load()

let console: Console = Console(storage: storage)

console.run()

storage.save()

