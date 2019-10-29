//
//  Console.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

class Console {
    private let storage: Storage
    
    init(storage: Storage) {
        self.storage = storage
    }
    
    func run() {
        var isWorked: Bool = true
        while isWorked {
            print("Write command:", separator: "", terminator: "")
            guard let commandOfStr = readLine() else {
                
                fatalError("Ooops...")
            }
            guard let command = Command(rawValue: commandOfStr) else {
                print("Please write correct command: [\(allCommandsOfStr())]")
                continue
            }
            
            switch command {
            case .exit:
                isWorked = false
            case .print:
                printCarList()
            case .add:
                addCar()
            case .remove:
                removeCar()
            }
        }
    }
    
    private func allCommandsOfStr() -> String {
        var result: String = ""
        for command in Command.commands {
            result += "'\(command.rawValue)' "
        }
        return result
    }
    
    private func allCarCommands() -> String {
        var result: String = ""
        for command in CarCommands.commands {
            result += "'\(command.rawValue)' "
        }
        return result
    }
    
    private func printCarList() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        
        for (i, car) in storage.cars.enumerated() {
            print("#", i + 1, separator: "")
            print(car)
        }
        
    }
    
    private func addCar() {
        print("Write car name: ", separator: "", terminator: "")
        guard let carName = readLine() else {
            fatalError("Ooops...")
        }
        print("Write car year: ", separator: "", terminator: "")
        
        var carYear: Int = 0
        while true {
            guard let carYearOfStr = readLine(), let newCarYear = Int(carYearOfStr) else {
                print("Please write correct year")
                continue
            }
            
            carYear = newCarYear
            break
        }
        
        print("Write car model: ", separator: "", terminator: "")
        guard let carModel = readLine() else {
            fatalError("Ooops...")
        }
        
        storage.addCar(Car(name: carName, year: carYear, model: carModel))
        print("Car was successfully added")
    }
    
    private func removeCar() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        var byWhat: CarCommands = .id
        
        while true{
            print("Want to remove car by characteristic or by id?(char/id) ", separator: "", terminator: "")
            guard let read = readLine() else {
                fatalError("Ooops...")
            }
            
            guard let command = CarCommands(rawValue: read) else {
                print("Please write correct command: [\(allCarCommands())]")
                continue
            }
            byWhat = command
            break
        }
        
        switch byWhat {
        case .id:
            removeCarById()
        case .characteristic:
            removeCarByChar()
        }
    }
    
    private func removeCarById() {
        while true{
            print("Write car id:" ,separator: "", terminator: "")
            guard let read = readLine() else {
                fatalError("Ooops...")
            }
            guard let id = Int(read) else {
                print("Please write correct id")
                continue
            }
            
            if id > storage.cars.count || id <= 0 {
                print("Car with this id does not exist, try again")
                continue
            }
            let carToBeRemoved = storage.cars[id-1]
            
            storage.removeCar(storage.cars[id-1])
            
            print("Car that has been removed")
            print(carToBeRemoved)
            
            break
        }
    }
    
    private func removeCarByChar() {
        while true {
            print("Write characteristic: ",separator: "", terminator: "")
            guard let someChar = readLine() else {
                fatalError("There is no characteristic found")
            }
            var carsToBeRemoved: [Car] = []
            
            for car in storage.cars {
                if car.name.contains(someChar) {
                    carsToBeRemoved.append(car)
                    storage.removeCar(car)
                    continue
                }
                if car.model.contains(someChar) {
                    carsToBeRemoved.append(car)
                    storage.removeCar(car)
                    continue
                }
                if String(car.year).contains(someChar) {
                    carsToBeRemoved.append(car)
                    storage.removeCar(car)
                    continue
                }
            }
            if carsToBeRemoved.isEmpty {
                print("None of the cars has '\(someChar)' as a characteristic")
            } else {
                print("Cars that have been removed:")
                for (i, car) in carsToBeRemoved.enumerated() {
                    print("#", i + 1, separator: "")
                    print(car)
                }
            }
            
            break
        }
    }
}
