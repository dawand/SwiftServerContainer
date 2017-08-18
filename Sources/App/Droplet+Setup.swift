import Vapor

let manager = Manager()

extension Droplet {
    public func setup() throws {
	
	 Benchmark.runBenchmark()

        get("/") { _ in
            try self.view.make("index.html")
	
	  // debugging
        }
        
        socket("connect") { req, ws in
            var username: String? = nil
            
            ws.onText = { ws, text in
                let json = try JSON(bytes: Array(text.utf8))
                
                if let u = json.object?["username"]?.string {
                    username = u
                    manager.connections[u] = ws
                    manager.transceive("\(u) is connected")
                    
                //   print(SysInfo.CPU)
                //    Benchmark.runBenchmark()
                }
                
                if let u = username, let m = json.object?["message"]?.string {
                    manager.send(name: u, message: m)
                }
                
                if let u = username,
                    let t = json.object?["TextSearch"]?.string,
                    let s = json.object?["start"]?.int,
                    let e = json.object?["end"]?.int
                {
                    let startTime = Date()
                    let words = TextSearch.searchTerm(t,start:s,end:e)
                    let time = startTime.timeIntervalSinceNow
                    manager.sendResult(name: u, result: words, timeInSec: abs(time))
                }
                
                if let u = username,
                    let t = json.object?["Sorting"]?.string,
                    let s = json.object?["start"]?.int,
                    let e = json.object?["end"]?.int
                {
                    print("File name: \(t)")
                    let startTime = Date()
                    let words = SortText(start:s,end:e)
                    let time = startTime.timeIntervalSinceNow
                    manager.sendResult(name: u, result: words.count, timeInSec: abs(time))
                }
            }
            
            ws.onClose = { ws, _, _, _ in
                guard let u = username else {
                    return
                }
                
                manager.transceive("\(u) is disconnected")
                manager.connections.removeValue(forKey: u)
            }
        }
    }
}
