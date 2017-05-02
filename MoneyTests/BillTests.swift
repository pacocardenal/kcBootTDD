import XCTest
@testable import Money

class BillTests: XCTestCase {
    
    var five: Bill!
    var otherFive: Bill!
    var ten: Bill!
    var broker: Broker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        five = Bill(amount: 5)
        otherFive = Bill(amount: 5)
        ten = Bill(amount: 10)
        broker = Broker()
        broker.addRate(from: "€", to: "€", rate: 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreation() {
        XCTAssertNotNil(Bill())
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
    
    func testSimpleReduction() {
        XCTAssertEqual(try! five.reduced(to: "€", broker: broker), five)
        XCTAssertNotEqual(try! five.reduced(to: "€", broker: broker), ten)
    }
    
}
