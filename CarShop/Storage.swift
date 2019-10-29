//
//  Storage.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

import Foundation

private let fileURL = URL(fileURLWithPath: "/Users/maksakovsky/Desktop/tenzor/CarShop/cars.txt")

class Storage {
    internal private(set) var cars: [Car] = []
    
    func addCar(_ car: Car) {
        cars.append(car)
    }
    
    func removeCar(_ carForRemove: Car) {
        cars.removeAll { car in
            return car === carForRemove            
        }
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(cars) else {
            fatalError("Can't encode data")
        }
        
        try? data.write(to: fileURL)
    }
    
    func load() {
        guard let data = try? Data(contentsOf: fileURL) else {
            print("File does not exist")
            return
        }
        guard let loadedCars = try? JSONDecoder().decode([Car].self, from: data) else {
            print("There is no suitable vehicle information in cars.txt file")
            return
        }
        
        cars = loadedCars
    }
    
}
