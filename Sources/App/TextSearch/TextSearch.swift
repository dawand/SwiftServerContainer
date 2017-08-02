

import Foundation

public class TextSearch {
    
    // search the text file and return the number of words found
    class func searchTerm (_ term: String, start:Int, end:Int) -> Int {
        
        var str = readFile()
        
        if start != 0 && end != 0 {
            let startIndex = str.index(str.startIndex, offsetBy:start)
            let endIndex = str.index(str.startIndex, offsetBy:end)
            print("searching from \(startIndex) , to \(endIndex)")
            str = str[startIndex..<endIndex]
        }
        
        let indexes = KMP.search(text:str, pattern:term)
        
        return indexes.count
    }
}
