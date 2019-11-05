//
//  Console.swift
//  CarShop
//
//  Created by Никита Максаковский on 27.10.2019.
//  Copyright © 2019 Никита Максаковский. All rights reserved.
//

class Console {
    private let storage: Storage
    
    private var fields: [String] // можно было реализовать через протоколы, но не успел
    private var countOfFields: Int
    
    init(storage: Storage) {
        self.storage = storage
        self.fields = []
        self.countOfFields = 0
    }
    
    func run() {
        
        while true {
            print("Write count of fields:", separator: "", terminator: "")
            guard let newLine = readLine(), let newCount = Int(newLine) else {
                print("Please write correct number")
                continue
            }
            countOfFields = newCount
            break
        }
        
        while fields.count != countOfFields {
            print("Write field name:", separator: "", terminator: "")
            guard let field = readLine() else {
                fatalError("There is no field name")
            }
            fields.append(field)
        }
        
        storage.removeExcessCars(count: countOfFields, fields: self.fields)
        
        
        var isWorked: Bool = true
        while isWorked {
            print("Write command:", separator: "", terminator: "")
            guard let commandOfStr = readLine() else {
                fatalError("There is no command")
            }
            guard let command = Command(rawValue: commandOfStr) else {
                print("Please write correct command: [\(Command.allCommands())]")
                continue
            }
            
            switch command {
            case .exit:
                isWorked = false
            case .print:
                printCarList()
            case .remove:
                removeCar()
            case .add:
                addCar(addingAfter: false)
            case .addAfter:
                addCar(addingAfter: true)
            }
            
        }
    }
    
    private func printCarList() {
        if storage.cars.isEmpty {
            print("List is empty")
            return
        }
        storage.printCars()
    }
    
    private func addCar(addingAfter: Bool) {
        var position: Int = storage.cars.count
        if addingAfter {
            while true {
                print("Write position to add after")
                guard let positionToAdd = readLine(), let newPosition = Int(positionToAdd) else {
                    print("Please write correct number")
                    continue
                }
                position = newPosition
                if position < 0 || position > storage.cars.count {
                    print("Please write correct position")
                    continue
                }
                break
            }
        }
        var carFields: [String : String] = [:]
        for field in fields {
            print("Write car \(field): ", separator: "", terminator: "")
            guard let carField = readLine() else {
                fatalError("There is no car \(field)")
            }
            carFields[field] = carField
        }
       
        
        storage.cars.insert(Car(chars: carFields), at: position)
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
                fatalError("There is no answer(char/id)")
            }
            
            guard let command = CarCommands(rawValue: read) else {
                print("Please write correct command: [\(CarCommands.allCommands())]")
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
                fatalError("There is no car id")
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
                for (_, value) in car.chars {
                    if value.contains(someChar) {
                        carsToBeRemoved.append(car)
                        storage.removeCar(car)
                        continue
                    }
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
