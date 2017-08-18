class Benchmark{
    
    class func runBenchmark(){
        
        //Mandelbrot
        let workload = MandelbrotWorkload(width: 1600, height: 1600)
        let result = workload.run()
        printResult(result)
        
        // FFT
        let workload2 = SFFTWorkload(size: 8 * 2048 * 2048, chunkSize: 4096)
        let result2 = workload2.run()
        printResult(result2)

        // Fibonnaci
        let workload3 = FibonacciWorkload(n: 40)
        let result3 = workload3.run()
        printResult(result3)
        
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
