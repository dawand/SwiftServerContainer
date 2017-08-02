//
//  SortText.swift
//  
//
//  Created by Dawand Sulaiman on 25/07/2017.
//
//

public func SortText(start:Int, end:Int) -> [String] {
    var str = readFile()
    
    if start != 0 && end != 0 {
        let startIndex = str.index(str.startIndex, offsetBy:start)
        let endIndex = str.index(str.startIndex, offsetBy:end)
        print("sorting from \(startIndex) , to \(endIndex)")
        str = str[startIndex..<endIndex]
    }
    
    let array = str.components(separatedBy: " ")
    let result = quicksort(array)
    
    print(result)
    
    return result
}

