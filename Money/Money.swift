import Foundation

public typealias Currency = String

enum MoneyErrors: Error {
    case reducedError
}

struct Money {
    
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
    
    func reduced(to: Currency, broker: Broker) throws -> Money {
        do {
            let changeRate = try broker.rate(from: self.badge, to: to)
            return Money(amount: self.amount * changeRate, badge: to)
        } catch {
            print("error in reduced \(error)")
            throw MoneyErrors.reducedError
        }
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
