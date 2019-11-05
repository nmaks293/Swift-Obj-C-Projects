//
//  Car.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

import Foundation

struct Car: CustomStringConvertible, Equatable, Codable {
    private let id: UUID = UUID()
    let chars: [String : String]
    
    var description: String {
        var string: String = ""
        for (field,value) in chars {
            string += "  \(field): \(value)\n"
        }
        return string
    }
    
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.id == rhs.id
    }
}

