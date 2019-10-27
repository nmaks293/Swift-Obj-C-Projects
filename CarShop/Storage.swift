//
//  Storage.swift
//  AutoCatalog
//
//  Created by Гость on 24/10/2019.
//  Copyright © 2019 sia. All rights reserved.
//

class Storage {
    internal private(set) var cars: [Car] = []
    
    func addCar(_ car: Car) {
        cars.append(car)
    }
    
    func removeCar(_ carForRemove: Car) {
        cars.removeAll { car in
            return car == carForRemove
        }
    }
}
