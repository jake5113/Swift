import Foundation

class Vehicle {
    private var model: String
    private var color: String
    
    init(model: String, color: String) {
        self.model = model
        self.color = color
    }
    
    func drive()  {
        print(model, color, terminator: "")
    }
}

class Car: Vehicle {
    private var doorNumber: Int
    
    init(model: String, color: String, doorNumber: Int) {
        self.doorNumber = doorNumber
        super.init(model: model, color: color)
    }
    
    override func drive() {
        super.drive()
        print("자동차가 \(doorNumber)개의 문을 열고 달립니다.")
    }
}

class Motorcycle: Vehicle {
    private var helmet: Bool
    
    init(model: String, color: String, helmet: Bool) {
        self.helmet = helmet
        super.init(model: model, color: color)
    }
    
    override func drive() {
        super.drive()
        if helmet {
            print("오토바이가 헬멧을 쓰고 달립니다.")
        } else {
            print("오토바이가 헬멧을 쓰지 않고 달립니다.")
        }
    }
}

let car: Vehicle = Car(model: "소나타", color: "검정", doorNumber: 4)
let motorcycle: Vehicle = Motorcycle(model: "니노", color: "노랑", helmet: true)
car.drive()
motorcycle.drive()

