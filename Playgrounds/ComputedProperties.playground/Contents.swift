import Foundation

var pizzaInInches: Int = 10 {
    willSet {
        print(pizzaInInches)
        print(newValue)
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size sprcified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 33
print(pizzaInInches)


var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    set {
        print("numberOfSlices has now a new value which is \(newValue)")
    }
}

var numberOfPizzas: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}
numberOfPizzas = 4
print(numberOfPeople)


