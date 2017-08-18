import Foundation

final class FibonacciWorkload : Workload {
    var n : UInt
    var output : UInt
    var nodes : UInt
    
    init(n : UInt) {
        self.n = n
        self.output = 0
        self.nodes = 0
    }
    
    override func worker() {
        let tmp = FibonacciWorkload.fibonacci(self.n)
        self.output = tmp.f
        self.nodes = tmp.nodes
    }
    
    class func fibonacci(_ n : UInt) -> (f : UInt, nodes : UInt) {
        if n == 0 {
            return (0, 1);
        } else if n == 1 {
            return (0, 1);
        } else {
            let left = fibonacci(n - 1)
            let right = fibonacci(n - 2)
            return (left.f + right.f, left.nodes + right.nodes + 1)
        }
    }
    
    override func reset() {
        self.nodes = 0
    }
    
    override func work() -> UInt64 {
        return UInt64(self.nodes)
    }
    
    override func units() -> WorkloadUnits {
        return WorkloadUnits.nodesSecond
    }
    
    override func name() -> String {
        return "Fibonacci"
    }
}
