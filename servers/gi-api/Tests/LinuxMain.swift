import XCTest

import gi_apiTests

var tests = [XCTestCaseEntry]()
tests += gi_apiTests.allTests()
XCTMain(tests)