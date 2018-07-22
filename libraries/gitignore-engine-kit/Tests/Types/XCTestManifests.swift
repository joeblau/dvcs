import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(gitignore_engine_kitTests.allTests),
    ]
}
#endif