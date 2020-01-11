import XCTest

import CopyOnWriteTests

var tests = [XCTestCaseEntry]()
tests += CopyOnWriteTests.allTests()
XCTMain(tests)
