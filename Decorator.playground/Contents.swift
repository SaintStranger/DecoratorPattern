import Foundation

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return 350
    }
}


// MARK: Decorator
protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
}


// MARK: Decorator realizations
class Milk: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 30
    }
    
    init(base: Coffee) {
        self.base = base
    }
}

class Cream: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 50
    }
    
    init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        return base.cost + 5
    }
    
    init(base: Coffee) {
        self.base = base
    }
}


let coffee = SimpleCoffee()
let coffeeWithMilk = Milk(base: coffee)
let coffeeWithCream = Cream(base: coffee)
let coffeeWithSugar = Sugar(base: coffee)
let coffeeWithMilkAndSugar = Sugar(base: coffeeWithMilk)
let coffeeWithCreamAndSugar = Sugar(base: coffeeWithCream)
let coffeeWithMilkCreamAndSugar = Milk(base: coffeeWithCreamAndSugar)


print(coffee.cost)
print(coffeeWithMilk.cost)
print(coffeeWithCream.cost)
print(coffeeWithSugar.cost)
print(coffeeWithMilkAndSugar.cost)
print(coffeeWithCreamAndSugar.cost)
print(coffeeWithMilkCreamAndSugar.cost)
