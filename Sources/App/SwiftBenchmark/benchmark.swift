class Benchmark{
    
    class func runBenchmark(){
        let workload = MandelbrotWorkload(width: 800, height: 800)
        let result = workload.run()
        printResult(result)
    }
    
    class func printResult(_ result : WorkloadResult) {
        print(result.workloadName)
        for (rate, runtime) in zip(result.rates, result.runtimes) {
            let rateString = result.workloadUnits.stringFromRate(rate)
            print("  \(rateString) (\(runtime) seconds)")
        }
        
        let minRate = result.rates.reduce(Double.infinity) { min($0, $1) }
        let maxRate = result.rates.reduce(0) { max($0, $1) }
        let avgRate = result.rates.reduce(0) { $0 + $1 } / Double(result.rates.count)
        
        let minString = result.workloadUnits.stringFromRate(minRate)
        let maxString = result.workloadUnits.stringFromRate(maxRate)
        let avgString = result.workloadUnits.stringFromRate(avgRate)
        
        print("")
        print("  Min rate: \(minString)")
        print("  Max rate: \(maxString)")
        print("  Avg rate: \(avgString)")
        print("")
    }

}
