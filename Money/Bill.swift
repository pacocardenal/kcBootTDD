import Foundation

public typealias Currency = String

enum BillErrors: Error {
    case reducedError
}

struct Bill: Money {
    
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
    
    func times(_ numberTimes: Decimal) -> Bill {
        return Bill(amount: self.amount * numberTimes, badge: self.badge)
    }
    
    func plus(_ addedMoney: Bill) -> Bill {
        return Bill(amount: (self.amount + addedMoney.amount), badge: self.badge)
    }
    
    func reduced(to: Currency, broker: Broker) throws -> Bill {
        do {
            let changeRate = try broker.rate(from: self.badge, to: to)
            return Bill(amount: self.amount * changeRate, badge: to)
        } catch {
            print("error in reduced \(error)")
            throw BillErrors.reducedError
        }
    }
    
}

extension Bill: Equatable {
    public static func ==(lhs: Bill, rhs: Bill) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.badge == rhs.badge)
    }
}

extension Bill: Hashable {
    public var hashValue: Int {
        get {
            return self.amount.hashValue + self.badge.hashValue
        }
    }
}

extension Bill: CustomStringConvertible {
    public var description: String {
        get {
            return "\(self.amount) \(self.badge)"
        }
    }
}
