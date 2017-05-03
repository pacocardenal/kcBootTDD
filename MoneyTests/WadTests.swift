import XCTest

class WadTests: XCTestCase {
    
//    var five: Wad!
//    var otherFive: Wad!
//    var ten: Wad!
//    var broker: Broker!
    var emptyWad: Wad!
    var singleBillWad: Wad!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        five = Wad(amount: 5)
//        otherFive = Wad(amount: 5)
//        ten = Wad(amount: 10)
//        broker = Broker()
//        broker.addRate(from: "€", to: "€", rate: 1)
        emptyWad = Wad()
        singleBillWad = Wad(amount: 42, badge: "$")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreation() {
        XCTAssertNotNil(Wad())
    }
    
    func testSimpleAddition() {
        XCTAssertEqual(singleBillWad.plus(Wad(amount: 8)), Wad(amount: 50))
    }
    
    func testEquality() {
        XCTAssertEqual(emptyWad, emptyWad)
        XCTAssertEqual(singleBillWad, singleBillWad)
        
        XCTAssertNotEqual(emptyWad, singleBillWad)
        
        let tenEuros = Wad(amount: 10, badge: "€")
        let tenDollars = Wad(amount: 10, badge: "$")
        
        let fifty1 = Wad(amount: 50, badge: "$")
        let fifty2 = Wad(amount: 10, badge: "€").plus(tenEuros).plus(tenDollars).plus(tenDollars).plus(tenEuros)
        let fifty3 = Wad(amount: 30, badge: "€").plus(tenDollars).plus(tenEuros)
        
        XCTAssertEqual(fifty1, fifty2)
        XCTAssertEqual(fifty1, fifty3)
        XCTAssertEqual(fifty2, fifty3)
        
    }
    
//    func testThatObjectWithEqualHashAreEqual() {
//        XCTAssertEqual(five.hashValue, otherFive.hashValue)
//        XCTAssertNotEqual(ten.hashValue, otherFive.hashValue)
//    }
//    
    func testSimpleMultiplication() {
        let eightyFour = singleBillWad.times(2)
        XCTAssertEqual(eightyFour, Wad(amount: 84))
    }
//
//    func testSimpleReduction() {
//        XCTAssertEqual(try! five.reduced(to: "€", broker: broker), five)
//        XCTAssertNotEqual(try! five.reduced(to: "€", broker: broker), ten)
//    }

    
}
