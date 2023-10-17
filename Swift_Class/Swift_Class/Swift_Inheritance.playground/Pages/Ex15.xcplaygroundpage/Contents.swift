
import Foundation

class Food {
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
        print("FOOD")
    }
    
    func order()  {
        
    }
    
}

class Pizza: Food {
    private var topping: String
    
    init(name: String, price: Int, topping: String) {
        print("PIZZA START")
        self.topping = topping
        super.init(name: name, price: price)
        print("PIZZA END")
    }
    
    override func order() {
        super.order()
        print(name, price, topping)
    }
    
}

class Pasta: Food {
    private var sauce: String
    
    init(name: String, price: Int, sauce: String) {
        print("PASTA START")
        self.sauce = sauce
        super.init(name: name, price: price)
        print("PASTA END")
    }
    
    override func order() {
        super.order()
        print(name, price, sauce)
        
    }
}

let cheesePizza: Food = Pizza(name: "치즈", price: 15000, topping: "치즈")
let motorcycle: Food = Pasta(name: "카르보나라", price: 12000, sauce: "크림")
cheesePizza.order()
motorcycle.order()



