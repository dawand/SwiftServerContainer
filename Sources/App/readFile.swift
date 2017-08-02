//
//  readFile.swift
//  
//
//  Created by Dawand Sulaiman on 25/07/2017.
//
//

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

import Foundation

public func readFile() -> String {
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
    
    return str
}
