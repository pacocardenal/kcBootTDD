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

extension Euro: Equatable {
    public static func ==(lhs: Euro, rhs: Euro) -> Bool {
        return lhs.amount == rhs.amount
    }
}

extension Euro: Hashable {
    public var hashValue: Int {
        get {
            return self.amount.hashValue
        }
    }
}

extension Euro: CustomStringConvertible {
    public var description: String {
        get {
            return "\(self.amount) €"
        }
    }
}
