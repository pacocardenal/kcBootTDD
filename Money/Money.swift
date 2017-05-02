import Foundation

struct Money {
    
    typealias Currency = String
    
    let amount: Decimal
    let badge: Currency
    
    init(amount: Decimal, badge: Currency) {
        self.amount = amount
        self.badge = badge
    }
    
    init(amount: Decimal) {
        self.init(amount: amount, badge: "€")
    }
    
    init() {
        self.init(amount: 0)
    }
    
    func times(_ numberTimes: Decimal) -> Money {
        return Money(amount: self.amount * numberTimes, badge: self.badge)
    }
    
    func plus(_ addedMoney: Money) -> Money {
        return Money(amount: (self.amount + addedMoney.amount), badge: self.badge)
    }
    
}

extension Money: Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.badge == rhs.badge)
    }
}

extension Money: Hashable {
    public var hashValue: Int {
        get {
            return self.amount.hashValue + self.badge.hashValue
        }
    }
}

extension Money: CustomStringConvertible {
    public var description: String {
        get {
            return "\(self.amount) \(self.badge)"
        }
    }
}
