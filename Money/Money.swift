import Foundation

protocol Money {
    
    init(amount: Decimal, badge: Currency)
    func times(_ numberTimes: Decimal) -> Self
    func plus(_ addedMoney: Self) -> Self
    func reduced(to: Currency, broker: Broker) throws -> Self
    
}
