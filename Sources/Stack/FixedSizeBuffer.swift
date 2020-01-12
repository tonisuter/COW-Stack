class FixedSizeBuffer<Element> {
    private let baseAddress: UnsafeMutablePointer<Element>
    let capacity: Int
    private(set) var count: Int
    
    init(capacity: Int) {
        self.baseAddress = UnsafeMutablePointer<Element>.allocate(capacity: capacity)
        self.capacity = capacity
        self.count = 0
    }
    
    init(cloning buffer: FixedSizeBuffer<Element>) {
        self.baseAddress = UnsafeMutablePointer<Element>.allocate(capacity: buffer.capacity)
        self.baseAddress.initialize(from: buffer.baseAddress, count: buffer.count)
        self.capacity = buffer.capacity
        self.count = buffer.count
    }
    
    func append(_ element: Element) {
        precondition(count < capacity, "Can't append element to a full buffer")
        
        (baseAddress + count).initialize(to: element)
        count += 1
    }
    
    func removeLast() -> Element {
        precondition(count > 0, "Can't remove last element from an empty buffer")
        
        count -= 1
        let result = baseAddress[count]
        (baseAddress + count).deinitialize(count: 1)
        return result
    }
    
    subscript(index: Int) -> Element {
        precondition(index < count, "Index out of range")
        return baseAddress[index]
    }
    
    deinit {
        baseAddress.deinitialize(count: count)
        baseAddress.deallocate()
    }
}
