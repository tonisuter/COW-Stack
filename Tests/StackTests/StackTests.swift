import XCTest
@testable import Stack

final class StackTests: XCTestCase {
    func testCount() {
        var stack = Stack<Int>(capacity: 10)
        XCTAssertEqual(stack.count, 0)
        stack.push(10)
        XCTAssertEqual(stack.count, 1)
        stack.push(11)
        stack.push(12)
        XCTAssertEqual(stack.count, 3)
        stack.pop()
        XCTAssertEqual(stack.count, 2)
    }
    
    func testIsEmpty() {
        var stack = Stack<Int>(capacity: 10)
        XCTAssertTrue(stack.isEmpty)
        stack.push(10)
        XCTAssertFalse(stack.isEmpty)
        stack.push(11)
        XCTAssertFalse(stack.isEmpty)
        stack.pop()
        XCTAssertFalse(stack.isEmpty)
        stack.pop()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testPushAndPop() {
        var stack = Stack<Int>(capacity: 10)
        stack.push(10)
        stack.push(11)
        stack.push(12)
        XCTAssertEqual(stack.pop(), 12)
        XCTAssertEqual(stack.pop(), 11)
        XCTAssertEqual(stack.pop(), 10)
    }
    
    func testPeek() {
        var stack = Stack<Int>(capacity: 10)
        XCTAssertNil(stack.peek())
        stack.push(10)
        stack.push(11)
        stack.push(12)
        XCTAssertEqual(stack.peek(), 12)
        stack.pop()
        XCTAssertEqual(stack.peek(), 11)
        stack.pop()
        XCTAssertEqual(stack.peek(), 10)
        stack.pop()
        XCTAssertNil(stack.peek())
    }
    
    func testDescription() {
        var intStack = Stack<Int>(capacity: 10)
        XCTAssertEqual(String(describing: intStack), "[]")
        intStack.push(10)
        intStack.push(11)
        intStack.push(12)
        XCTAssertEqual(String(describing: intStack), "[10, 11, 12]")
        
        var stringStack = Stack<String>(capacity: 10)
        XCTAssertEqual(String(describing: stringStack), "[]")
        stringStack.push("One")
        stringStack.push("Two")
        stringStack.push("Three")
        XCTAssertEqual(String(describing: stringStack), #"["One", "Two", "Three"]"#)
    }
    
    func testValueSemantics() {
        var stack1 = Stack<String>(capacity: 10)
        stack1.push("One")
        stack1.push("Two")
        stack1.push("Three")
    
        var stack2 = stack1
        XCTAssertEqual(stack1.count, 3)
        XCTAssertEqual(stack2.count, 3)
        
        stack1.pop()
        XCTAssertEqual(stack1.count, 2)
        XCTAssertEqual(stack2.count, 3)
        
        stack2.push("Four")
        XCTAssertEqual(stack1.count, 2)
        XCTAssertEqual(stack2.count, 4)
    }
    
    func testCopyOnWrite() {
        var stack1 = Stack<String>(capacity: 10)
        stack1.push("One")
        stack1.push("Two")
        
        var stack2 = stack1
        XCTAssertEqual(stack1.count, 2)
        XCTAssertEqual(stack2.count, 2)
        XCTAssert(stack1.buffer === stack2.buffer)
        
        stack2.pop()
        XCTAssertEqual(stack1.count, 2)
        XCTAssertEqual(stack2.count, 1)
        XCTAssert(stack1.buffer !== stack2.buffer)
    }
    
    static var allTests = [
        ("testCount", testCount),
        ("testIsEmpty", testIsEmpty),
        ("testPushAndPop", testPushAndPop),
        ("testPeek", testPeek),
        ("testDescription", testDescription),
        ("testValueSemantics", testValueSemantics),
        ("testCopyOnWrite", testCopyOnWrite)
    ]
}
