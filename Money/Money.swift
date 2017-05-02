import Foundation

protocol Money {
    
    init(amount: Decimal, badge: Currency)
    func times(_ numberTimes: Decimal) -> Bill
    func plus(_ addedMoney: Bill) -> Bill
    func reduced(to: Currency, broker: Broker) throws -> Bill
    
}
