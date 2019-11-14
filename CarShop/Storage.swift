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
    var cars: [Car] = []
    
    func addCar(_ car: Car) {
        cars.append(car)
    }
    
    func removeCar(_ carForRemove: Car) {
        cars.removeAll { car in
            return car == carForRemove
        }
    }
    
    func removeExcessCars(count: Int, fields: [String]) {
        for car in cars {
            if car.chars.keys.count != count {
                removeCar(car)
                continue
            }
            for (id,(field, _)) in car.chars.enumerated() {
                if field != fields[id] {
                    removeCar(car)
                    break
                }
            }
        }
    }
    
    func printCars() {
        for (i, car) in self.cars.enumerated() {
            print("#", i + 1, separator: "")
            print(car)
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
            print("There is no suitable vehicle information in this file")
            return
        }
        cars = loadedCars
        
    }
    
}
