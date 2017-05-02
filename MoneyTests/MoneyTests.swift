import XCTest
@testable import Money

class MoneyTests: XCTestCase {
    
    var five: Euro!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        five = Euro(amount: 5)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreation() {
        XCTAssertNotNil(Euro())
    }
    
    func testSimpleMultiplication() {
        let ten = five.times(2)
        XCTAssertEqual(ten.amount, 10)
    }
    
}
