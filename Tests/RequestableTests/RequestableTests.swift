import XCTest
@testable import Requestable

final class RequestableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Requestable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
