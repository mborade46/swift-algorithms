//
//  PrimeNumberAlgorithm.swift
//  AlogorithmsPractice
//
//  Created by Meenakshi Phadatare on 11/11/21.
//

import Foundation

struct Stack<T> {
    var storage = [T]()
    
    mutating func push(value: T){
        storage.append(value)
    }
    mutating func pop(){
        if !storage.isEmpty {
            
            storage.removeLast()
        }
        
    }
    mutating func isempty() -> Bool
    {
        return storage.isEmpty ? true:false
    }
}
class DataStructureAlgorithms {
    // MARK: -
    // MARK: Prime Number
    func isPrimeNumber(number : Int) -> Bool {
        
        var flag  = true
        var i = 2
        while i < number {
            
            if number % i == 0{
                flag = false
                break
            }
            i = i + 1
        }
        return flag
    }
    
    // MARK: -
    // MARK: Reverse Array
    
    
    
    // MARK: -
    // MARK: balanced parentheses
    /*// 1
     h((e))llo(world)() // balanced parentheses

     // 2
     (hello world // unbalanced parentheses
*/
    func balanceParantheses(word: String) -> Bool {
    
        var countParntheses = 0
        for char in word {
            if char == "(" {
                countParntheses = countParntheses + 1
            }
            if char == ")" {
                countParntheses =  countParntheses - 1
            }
            
        }
        if countParntheses == 0 {
            return true
        }else{
            return false }
    }
    //MARK:- balanced parantheses using stack
    //MARK:
    func balanceParanthesesWithStack(word: String) -> Bool {
    
        var stack = Stack<Character>()
        
        for char in word {
            
            if char == "(" {
                stack.push(value: char)
            }
            
            if char == ")" {
                stack.pop()
            }
            
        }
        return stack.isempty()
      
}
    //MARK:- sort 2D sort multidimentional
    //MARK:
    
    
    func sortArray(array: [Int]) -> [Int] {
        
        var numbers = array
        for i in 0..<numbers.count {
            
            var j = i
            while j > 0 &&  numbers[j-1]>numbers[j] {
                let temp = numbers[j]
                numbers[j] = numbers[j-1]
                numbers[j-1] = temp
                j = j - 1
            }
        }
        
        return numbers
    }

    func sortArray2D(arrays : [[Int]]) -> [[Int]] {
        
        var updatedarray = [[Int]]()
    
        for item in arrays {
            updatedarray.append(sortArray(array: item))
        }
        
        return updatedarray
    }
    
    func smallestCommon(arrays:[[Int]]) -> Int? {
        var smallestcommon : Int = -1
        
        var smallestarray = arrays[0]
        for i in 0...arrays.count {
            if  arrays[i].count < smallestarray.count {
                smallestarray = arrays[i]
                
            }
        }
        
        
        
        return smallestcommon
    }
    
    func isPalindrome(stringValue : String) -> Bool {
        var isPalindrome = true
        let newString = stringValue.lowercased()
        let charArray = newString.map {$0}
        var startIndex = 0
        var endIndex = charArray.count-1
        
        while startIndex <= endIndex {
            if charArray[startIndex] != charArray[endIndex] {
                
                isPalindrome = false
                break
            }
            else {
                startIndex += 1
                endIndex -= 1
            }
        }
        return isPalindrome
        
    }
    
    func findCommonPrefixFromArrayString(words: [String]) -> String {
        let sortedArray = words.sorted(by: {$0.count < $1.count })
        var prefix = ""
        if let firstWord = sortedArray.first {
            var shouldBreakOuterloop = false
            for index in 0..<firstWord.count {
                var wordIndex = 1
                while wordIndex < sortedArray.count {
                    let wordArr = sortedArray[wordIndex].map({$0})
                    let firstWordArr = firstWord.map({$0})
                    if firstWordArr[index] == wordArr[index] {
                        prefix.append(firstWordArr[index])
                    } else {
                        shouldBreakOuterloop = true
                    }
                    wordIndex += 1
                    break
                }
                if shouldBreakOuterloop {
                    break
                }
            }
        }
        return prefix
    }
    
    func commonPrefix(arrayOfStrings: [String]) -> String
    {
        var commonString = String()
        var commonInAll = String()
        _ = arrayOfStrings
       
        
        for startindex in 0..<arrayOfStrings.count - 1 {
            
            let firststring = arrayOfStrings[startindex]
            let secondString = arrayOfStrings[startindex+1]
            
            commonString = findPrefixInTwoString(str1: firststring, str2: secondString)
            if !commonString.hasPrefix(commonInAll) && !commonInAll.isEmpty && !commonString.isEmpty {
                commonInAll = findPrefixInTwoString(str1: commonString, str2: commonInAll)
            }
            else{
                commonInAll = commonString
            }
        }
            
        
        return commonInAll
    }
    
    func findKthLargestelementInaarray(arrayOfInteger:[Int],kth value:Int) -> Int{
        
        let sortedarray = arrayOfInteger.sorted(by: >)
        var arayWithoutduplication  = [sortedarray.first]
        
        for startIndex in 1..<sortedarray.count-1 {
        
            
            if arayWithoutduplication.last != sortedarray[startIndex] {
                
                arayWithoutduplication.append(sortedarray[startIndex])
            }
        }
    
        
        return arayWithoutduplication[value-1] ?? -1

        
    }
    
   

func findPrefixInTwoString(str1:String,str2: String) -> String{
    
    var common = String()
    
    let string1 = str1.map {$0.lowercased()}
    let string2 = str2.map{$0.lowercased()}
    
    let endindex = string1.count<string2.count ? string1.count : string2.count
    for i in 0..<endindex {
        
        if string1[i] == string2[i] {
            common.append(string1[i])
        }
        else{
            break
        }
    }
    
    return common
}
    func movesZerostoEnd(numbers: [Int])  -> [Int] {
        
        var dict = [Int:Int]()
        
        let arrayWithoutZero =  numbers.filter { number -> Bool in
            number != 0
        }
        
        let arrayWithZerosAtEnd = numbers.filter({$0 == 0})
        
        print(arrayWithoutZero)
        
        return arrayWithoutZero + arrayWithZerosAtEnd
    }

    
    func maxConsecativeOnes(binaryArray: [Int]) -> Int {
        
        var numberofTimesOnes = 0
        var countOnesArray = [Int]()
    
        if binaryArray[0] == 1 {
            numberofTimesOnes = 1
        }
        for start in 1...binaryArray.count-1 {
          
            
            
            if binaryArray[start] == 1 {
              
               numberofTimesOnes = numberofTimesOnes + 1
            }
            else if binaryArray[start-1] == 1 && binaryArray[start] == 0 {
                
                countOnesArray.append(numberofTimesOnes)
                numberofTimesOnes = 0
            }
           
        
        }
        if numberofTimesOnes != 0 {
            countOnesArray.append(numberofTimesOnes)
        }
        
        print(countOnesArray)
        return countOnesArray.sorted(by: >).first ?? 0
    }
    
    
     func findValidParanthesis(number : Int){
        
        
    }
    
    
   
}
        

        
    
