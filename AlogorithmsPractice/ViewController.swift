//
//  ViewController.swift
//  AlogorithmsPractice
//
//  Created by Meenakshi Phadatare on 11/11/21.
//

import UIKit


protocol Student {
    var name: String { get set }
    var middleName: String { get }
    var last: String { get set }
    func fullName() -> String
}

extension Student {
    var middleName: String {
        ""
    }
    
    func fullName() -> String {
        return name + last
    }
}

class MerryInstituteStudent: Student {
    
    private(set) var address: String
    
    var name: String = ""
    
    var last: String = ""
    
    init(address: String) {
        self.address = address
    }
    
    func updateAddress(newAddress: String)  {
        self.address = newAddress
    }
    
    
    
    
}


class ViewController: UIViewController {

    let dataStructureAL = DataStructureAlgorithms()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      //  let resultArray = primeNumberAlgorithmsViewModel.reversearray(array: [10,20])
      //  print("Reverse Array result: ", resultArray)
        
        
        let isprime = dataStructureAL.isPrimeNumber(number: 3)
        print(isprime)
        
    /*    let isbalanced = dataStructureAL.balanceParantheses(word: "()h((e))llo(world)()()")
        print(isbalanced)
        
        let isbalanced1 = dataStructureAL.balanceParanthesesWithStack(word: "(h((e))llo(world)()())(")
        print(isbalanced1) */
        
        let arrays  = [[7,4,9,9,4,2] ,[86,45,8,1,4]]
        let sorted = dataStructureAL.sortArray2D(arrays: arrays)
        print(sorted)
        
        
        let ispalindrome = dataStructureAL.isPalindrome(stringValue: "civic")
        print(ispalindrome)
        
        let common = dataStructureAL.commonPrefix(arrayOfStrings: ["the","there","they"])
        print(common)
        
        let commonPrefix = dataStructureAL.findCommonPrefixFromArrayString(words: ["geek", "geekCoder", "gee"])
        print("common prefix: ", commonPrefix)
        
        let kthInput = [10,12,11,2,1,5,6,4,3,2,1,5,6,4,6,6,7,9]
        let kthlargestNumber = dataStructureAL.findKthLargestelementInaarray(arrayOfInteger: kthInput, kth:2)
        print(kthlargestNumber)
        
        
        let arrayZeroAtEnd = dataStructureAL.movesZerostoEnd(numbers: [75,9,0,7,87,0,0,4,2,65,0,40,5,0])
        
        print(arrayZeroAtEnd)
        
        
        let numberofOnes = dataStructureAL.maxConsecativeOnes(binaryArray: [1,0,0,1,1,1,1,0,0,1,1,1,1,0,0])
        print(numberofOnes)
        
    }
    



}

