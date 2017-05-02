import Foundation

// Errors
enum BrokerErrors : Error{
    case unknownRate
}

// Typealiases
typealias RatesDictionary = [String:Rate]
typealias Rate = Decimal

// Protocols
protocol Rater{
    func rate(from: Currency, to: Currency) throws -> Rate
}

// Default implementations
extension Rater{
    func rate(from: Currency, to: Currency) throws -> Rate{
        return 1
    }
}

// Types
struct UnityBroker : Rater{}

struct Broker : Rater{
    var rates = RatesDictionary()
    private func makeKeyForRate(from: Currency, to: Currency) -> String {
        return "\(from)­->(\to)"
    }
    mutating func addRate(from: Currency, to:Currency, rate: Rate) {
        rates[makeKeyForRate(from: from, to: to)] = rate
        rates[makeKeyForRate(from: to, to: from)] = 1 / rate
        rates[makeKeyForRate(from: from, to: from)] = 1
        rates[makeKeyForRate(from: to, to: to)] = 1
    }
    
    func rate(from: Currency, to: Currency) throws -> Rate{
        guard let rate = rates[makeKeyForRate(from: from, to: to)] else{
            throw BrokerErrors.unknownRate
        }
        return rate
    }
    
}
