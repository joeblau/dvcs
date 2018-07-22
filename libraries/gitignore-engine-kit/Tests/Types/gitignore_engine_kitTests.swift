import XCTest
@testable import gitignore_engine_kit

final class gitignore_engine_kitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(gitignore_engine_kit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
