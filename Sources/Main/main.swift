import Stack

class Person: CustomStringConvertible {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        String(reflecting: name)
    }
    
    deinit {
        print("\(String(describing: self)) has been deinited")
    }
}

func main() {
    var stack1 = Stack<Person>(capacity: 10)
    stack1.push(Person(name: "Bob"))
    stack1.push(Person(name: "Alice"))
    
    var stack2 = stack1
    print(stack1, stack2)
    stack2.pop()
    stack2.pop()
    print(stack1, stack2)
}

main()
