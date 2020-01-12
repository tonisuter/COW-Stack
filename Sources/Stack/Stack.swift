public struct Stack<Element>: CustomStringConvertible {
    var buffer: FixedSizeBuffer<Element>

    public init(capacity: Int) {
        self.buffer = FixedSizeBuffer(capacity: capacity)
    }

    var bufferForWriting: FixedSizeBuffer<Element> {
        mutating get {
            if !isKnownUniquelyReferenced(&buffer) {
                buffer = FixedSizeBuffer(cloning: buffer)
            }
            return buffer
        }
    }

    public var count: Int { buffer.count }

    public var capacity: Int { buffer.capacity }

    public var isEmpty: Bool { count == 0 }

    public mutating func push(_ element: Element) {
        precondition(count < capacity, "Can't push element onto a full stack")
        bufferForWriting.append(element)
    }

    @discardableResult
    public mutating func pop() -> Element {
        precondition(!isEmpty, "Can't pop last element from an empty stack")
        return bufferForWriting.removeLast()
    }

    public func peek() -> Element? {
        guard !isEmpty else {
            return nil
        }
        return buffer[count - 1]
    }

    public var description: String {
        var result = "["
        result += (0..<count).map { String(reflecting: buffer[$0]) }.joined(separator: ", ")
        result += "]"
        return result
    }
}
