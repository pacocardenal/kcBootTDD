import Foundation

enum BrokerErrors : Error {
    case unknownRate
}

typealias RatesDictionary = [String:Rate]
typealias Rate = Decimal

struct Broker {
    
    var rates = RatesDictionary()
    
    private func makeKeyForRate(from: Currency, to: Currency) -> String {
        return "\(from)­->\(to)"
    }
    
    mutating func addRate(from: Currency, to:Currency, rate: Rate) {
        rates[makeKeyForRate(from: from, to: to)] = rate // directo
        rates[makeKeyForRate(from: to, to: from)] = 1 / rate // inverso
        rates[makeKeyForRate(from:from,to:from)] = 1 //trivial
        rates[makeKeyForRate(from: to, to: to)] = 1 // trivial
    }

    func rate(from: Currency, to: Currency) throws -> Rate {
        guard let rate = rates[makeKeyForRate(from: from, to: to)] else{
            throw BrokerErrors.unknownRate
        }
        return rate
    }
    
}
