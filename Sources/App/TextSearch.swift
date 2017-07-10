#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

import Foundation

public class TextSearch {
    
    // search the text file and return the number of words found
    class func searchTerm (_ term: String, start:Int, end:Int) -> Int {
        
        var str = ""
        
        // the text file path
        let path = "./Resources/big.txt"
        let BUFSIZE = 1024
        
        let fp = fopen(path, "r")
        
        if fp != nil {
            var buf = [CChar](repeating:CChar(0), count:BUFSIZE)
            while fgets(&buf, Int32(BUFSIZE), fp) != nil {
                str += String(cString:buf)
            }
        }
        
        	let startIndex = str.index(str.startIndex, offsetBy:start)
        	let endIndex = str.index(str.startIndex, offsetBy:end)
        	print("searching from \(startIndex) , to \(endIndex)")
        	let textToSearch = str[startIndex..<endIndex]
        
        let indexes = KMP.search(text:str, pattern:term)
        
        return indexes.count
    }
}
