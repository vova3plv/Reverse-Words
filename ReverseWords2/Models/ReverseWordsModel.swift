import Foundation

class ReverseRules {

    func reverseWords(_ words: String, with reverseFunction: (String) -> String) -> String {
        var result = [String]()
        let allWords = words.components(separatedBy: " ")
        
        for word in allWords {
            result.append(reverseFunction(word))
        }
        let reversedWords = result.joined(separator: " ")
        return reversedWords
    }
    
    func reverseWords(_ words: String, with reverseFunction: (String, String) -> String, _ ignoreSymbols: String) -> String {
        var result = [String]()
        let allWords = words.components(separatedBy: " ")
        
        for word in allWords {
            result.append(reverseFunction(word, ignoreSymbols))
        }
        let reversedWords = result.joined(separator: " ")
        return reversedWords
    }
    
    let alphabeticRule = {(word: String) in
        var symbols = Array(word)
        var r = symbols.count - 1
        var l = 0
        while l < r {
            if !symbols[l].isLetter {
                l+=1
            } else if !symbols[r].isLetter {
                r-=1
            } else {
                symbols.swapAt(l, r)
                l+=1
                r-=1
            }
        }
        return String(symbols)
    }
    
    let customRule = {(word: String, ignoreSymbols: String) in
        var symbols = Array(word)
        var r = symbols.count - 1
        var l = 0
        while l < r {
            if ignoreSymbols.contains(symbols[l]) {
                l+=1
            } else if ignoreSymbols.contains(symbols[r]) {
                r-=1
            } else {
                symbols.swapAt(l, r)
                l+=1
                r-=1
            }
        }
        return String(symbols)
    }

    let noRules = {(word: String) in
        var symbols = Array(word)
        var r = symbols.count - 1
        var l = 0
        while l < r {
            symbols.swapAt(l, r)
            l+=1
            r-=1
        }
        return String(symbols)
    }
}
