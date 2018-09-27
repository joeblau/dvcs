import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gi_apiTests.allTests),
    ]
}
#endif