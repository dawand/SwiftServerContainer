import Vapor

class Manager {
    var connections: [String: WebSocket]
    
    func transceive(_ message: String) {
        send(name: "transceiver: ", message: message)
    }
    
//    func sendResult<T>(name: String, result: T, timeInSec: Double){
    func sendResult(name: String, result: Int, timeInSec: Double){
        print("Result: \(result) in \(timeInSec) seconds")
        
        let resultNode : [String: NodeRepresentable] = [
            "username": name,
            "result": result,
            "timeInSec": timeInSec
        ]
        
        guard let json = try? JSON(node: resultNode) else {
            return
        }
        
        print("sending \(json)")
        
        for (_, socket) in connections {
            //	guard username != name else {
            //		continue
            //	}
            
            try? socket.send(json)
        }
    }
    
    func send(name: String, message: String) {
        let message = message.truncated(to: 256)
        
        let messageNode: [String: NodeRepresentable] = [
            "username": name,
            "message": message
        ]
        
        guard let json = try? JSON(node: messageNode) else {
            return
        }
        
        for (username, socket) in connections {
            guard username != name else {
                continue
            }
            
            try? socket.send(json)
        }
    }
    
    init() {
        connections = [:]
    }
}
