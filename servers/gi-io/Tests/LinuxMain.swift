import XCTest

import gi_ioTests

var tests = [XCTestCaseEntry]()
tests += gi_ioTests.allTests()
XCTMain(tests)