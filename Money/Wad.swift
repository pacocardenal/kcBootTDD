import Foundation

typealias Bills = [Bill]

struct Wad {
    var bills = Bills()
}

extension Wad : Money{
    
    init(amount: Decimal, badge: Currency) {
        bills.append(Bill(amount: amount, badge: badge))
    }
    
    init(amount: Decimal) {
        self.init(amount: amount, badge: "€")
    }
    
    func times(_ numberTimes: Decimal) -> Wad {
        var totalWad = Wad(amount: (self.bills.first?.amount)!)
        
        for bill in self.bills {
            totalWad = totalWad.plus(Wad(bills: [bill]))
        }
        
        return totalWad
    }
    
    func plus(_ addedMoney: Wad) -> Wad {
        return Wad(bills: bills + addedMoney.bills)
    }
    
    func reduced(to: Currency, broker: Rater) throws -> Bill {
        
        var total = Bill(amount: 0, badge: to)
        
        for bill in bills {
            total = try total.reduced(to: to, broker: broker).plus(try bill.reduced(to: to, broker: broker))
        }
        
        return total
        
    }

}

extension Wad: Equatable {
    public static func ==(lhs: Wad, rhs: Wad) -> Bool {
        let broker = UnityBroker()
        
        let leftBill = try! lhs.reduced(to: "€", broker: broker)
        let rightBill = try! rhs.reduced(to: "€", broker: broker)
        
        return leftBill == rightBill
    }
}
