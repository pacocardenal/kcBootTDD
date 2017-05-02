import Foundation

struct Euro {
    
    let amount: Decimal
    
    init(amount: Decimal) {
        self.amount = amount
    }
    
    init() {
        self.amount = 0
    }
    
    func times(_ numberTimes: Decimal) -> Euro {
        return Euro(amount: self.amount * numberTimes)
    }
}
