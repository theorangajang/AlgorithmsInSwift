//: Playground - noun: a place where people can play

import UIKit

//Reversed String
func ReverseString(str: String) -> String{
    var reversed = ""
    print(str.characters)
    for char in str.characters {
        //here we are appending the first letter to the string
        reversed.insert(char, at: reversed.startIndex)
    }
    return reversed
}

print()
print(ReverseString(str: "hello"));
print()

func Fibonacci(num: Int) -> Int{
    if(num <= 2){
        return 1
    }else{
        return Fibonacci(num: num-1) + Fibonacci(num: num-2)
    }
}

print()
print(Fibonacci(num: 7))
print()

func Factorial(num: Int) -> Int{
    if(num == 1){
        return 1
    }else{
        return num * Fibonacci(num: num-1)
    }
}

print()
print(Factorial(num: 7))
print()

func BinarySort(arr: Array<Int>){
    var mutatingArr = arr
    var firstPointer = 0
    var lastPointer = arr.count-1
    
    while firstPointer < lastPointer{
        print(mutatingArr)
        while mutatingArr[firstPointer] == 0 && firstPointer < lastPointer{
            firstPointer += 1
        }
        while mutatingArr[lastPointer] == 1 && firstPointer < lastPointer{
            lastPointer -= 1
        }
        if mutatingArr[firstPointer] > mutatingArr[lastPointer]{
            let temp = mutatingArr[firstPointer]
            mutatingArr[firstPointer] = mutatingArr[lastPointer]
            mutatingArr[lastPointer] = temp
            
        }
        print(mutatingArr)
    }
}

print()
print(BinarySort(arr: [0, 1, 0, 1, 1, 0, 1, 0]))
print()

func CountBrackets(str: String) -> Bool{
    var totalAmountOfBrackets = 0
    
    for strChar in str{
        if strChar == ")"{
            totalAmountOfBrackets += 1
        }else if strChar == "("{
            totalAmountOfBrackets -= 1
        }
    }
    
    return totalAmountOfBrackets == 0
}

print()
print(CountBrackets(str: "(())()"))
print(CountBrackets(str: "(())("))
print()
//let text = "abc"
//let index2 = text.index(text.startIndex, offsetBy: 2)
//let lastChar: Character = text[index2]
//print(lastChar)

func Palindrome(str: String) -> Bool{
    var reversed = ""
    
    for character in str.characters{
        //this is similar to the push method for an array in js
        reversed.insert(character, at: str.startIndex)
    }
    
    return reversed == str
}

print()
print(Palindrome(str: "hannah"))
print(Palindrome(str: "hanabaeh"))
print()

func LongestString(str: String){
    let mutableArr = str.split(separator: " ")
    
    for index in 0...mutableArr.count-1{
        print(mutableArr[index])
    }
}

LongestString(str: "find the longest word in the problem description")























