import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CopyOnWriteTests.allTests),
    ]
}
#endif
