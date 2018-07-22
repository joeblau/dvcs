import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gi_ioTests.allTests),
    ]
}
#endif