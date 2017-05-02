import XCTest
@testable import Money

class MoneyTests: XCTestCase {
    
    var five: Money!
    var otherFive: Money!
    var ten: Money!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        five = Money(amount: 5)
        otherFive = Money(amount: 5)
        ten = Money(amount: 10)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreation() {
        XCTAssertNotNil(Money())
    }
    
    func testSimpleMultiplication() {
        let ten = five.times(2)
        XCTAssertEqual(ten.amount, 10)
    }
    
    func testEquality() {
        XCTAssertEqual(otherFive, otherFive)
        XCTAssertEqual(five, otherFive)
        XCTAssertNotEqual(five, ten)
    }
    
    func testThatObjectWithEqualHashAreEqual() {
        XCTAssertEqual(five.hashValue, otherFive.hashValue)
        XCTAssertNotEqual(ten.hashValue, otherFive.hashValue)
    }
    
    func testSimpleAddition() {
        XCTAssertEqual(ten, five.plus(otherFive))
        XCTAssertNotEqual(five, five.plus(otherFive))
    }
    
}
