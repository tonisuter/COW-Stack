import XCTest
@testable import CopyOnWrite

final class CopyOnWriteTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CopyOnWrite().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
