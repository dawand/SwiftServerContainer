import Foundation

class KMP {
    
    // used for KMP, Build pi function of prefixes
    class func build_pi(_ str: String) -> [Int] {
        let n = str.characters.count
        var pi = Array(repeating: 0, count: n + 1)
        var k:Int = -1
        pi[0] = -1
        
        for i in 0..<n {
            while (k >= 0 && (str[str.characters.index(str.startIndex, offsetBy: k)] != str[str.characters.index(str.startIndex, offsetBy: i)])) {
                k = pi[k]
            }
            k+=1
            pi[i + 1] = k
        }
        
        return pi
    }
    
    // Knuth-Morris Pratt algorithm
    class func search(text:String, pattern: String) -> [Int] {
        
        // Convert to Character array to index in O(1)
        var patt = Array(pattern.characters)
        var S = Array(text.characters)
        
        var matches = [Int]()
        let n = text.characters.count
        
        let m = pattern.characters.count
        var k = 0
        var pi = build_pi(pattern)
        
        for i in 0..<n {
            while (k >= 0 && (k == m || patt[k] != S[i])) {
                k = pi[k]
            }
            k += 1
            if (k == m) {
                matches.append(i - m + 1)
            }
        }
        
        return matches
    }

}

//let words = KMP.search(text:"hello, this is a new text and a new line", pattern: "new")
//print(words) // [17, 32]
//print(words.count) // 2
