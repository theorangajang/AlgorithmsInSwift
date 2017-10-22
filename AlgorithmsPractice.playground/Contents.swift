//: Playground - noun: a place where people can play

import UIKit
import Foundation

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
print("Reverse String")
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
print("Fibonacci")
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
print("Factorial")
print(Factorial(num: 7))
print()

//need generic if you pass in an array or return array
//as you have to define what the array will contain
func BinarySort(arr: Array<Int>){
    var mutatingArr = arr
    var firstPointer = 0
    var lastPointer = arr.count-1
    
    while firstPointer < lastPointer{
        print(mutatingArr)
        while mutatingArr[firstPointer] == 0 && firstPointer < lastPointer{
            firstPointer += 1
        }
        
        //need to add last condition as in the previous while loop if 1 is added to firstPoint,
        //then if you to check in this while loop to make sure that it doesn't go over that index
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
print("Binary Sort")
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
print("Counting Brackets")
print(CountBrackets(str: "(())()"))
print(CountBrackets(str: "(())("))
print()

func Palindrome(str: String) -> Bool{
    var reversed = ""
    
    for character in str.characters{
        //this is similar to the push method for an array in js
        reversed.insert(character, at: str.startIndex)
    }
    
    return reversed == str
}

print()
print("Palindrome")
print(Palindrome(str: "hannah"))
print(Palindrome(str: "hanabaeh"))
print()

func LongestString(str: String) -> String{
    let mutableArr = str.split(separator: " ")
    var max = 0
    var maxString = ""
    
    for index in 0...mutableArr.count-1{
        let currentLen = mutableArr[index].count
        let currentStr = mutableArr[index]
        
        if mutableArr[index].count > max{
            max = currentLen
            maxString = String(currentStr)
        }
    }
    return maxString
}

print()
print("Longest String")
print(LongestString(str: "find the longest word in the problem description"))

func InsertionSort(arr: [Int]) -> [Int]{
    guard arr.count > 1 else{
        return arr
    }
    
    var copyArr = arr
    
    for index in 1...copyArr.count-1{
        print()
        print("starting \(copyArr)")
        var currentVal = copyArr[index]
        var j = index - 1
        while(currentVal < copyArr[j] && j >= 0){
            copyArr[j+1] = copyArr[j]
            print("switching \(copyArr)")
            j -= 1
        }
        copyArr[j+1] = currentVal
        
        print("ending \(copyArr)")
    }
    
    return copyArr
}

print()
print("Insertion Sort")
print(InsertionSort(arr: [0,9,2,8,4,3,7,5]))

func SelectionSort(arr: [Int]) -> [Int]{
    guard arr.count > 1 else{
        return arr
    }
    var copyArr = arr
    
    //must be exclusive of copyArr as you don't want to reach the last
    //since this will already be compared when reaching the second to last index value
    for currentIndex in 0..<copyArr.count-1{
        let secondIndex = currentIndex + 1
        var lowestIndex = currentIndex
        
        for nextIndex in secondIndex...copyArr.count-1{
            if copyArr[lowestIndex] > copyArr[nextIndex]{
                lowestIndex = nextIndex
            }
        }
        
        let temp = copyArr[currentIndex]
        copyArr[currentIndex] = copyArr[lowestIndex]
        copyArr[lowestIndex] = temp
    }
    
    return copyArr
}

print()
print("Selection Sort")
print(SelectionSort(arr: [0,9,2,8,4,3,7,5]))

func BinarySearch(arr: [Int], val: Int) -> Int?{
    guard arr.count > 1 else{
        return arr[0]
    }
    
    var copyArr = arr.sorted()
    var firstPointer = 0
    var lastPointer = copyArr.count-1

    while(firstPointer <= lastPointer){
        let midPointer = (lastPointer + firstPointer)/2

        if copyArr[midPointer] == val{
            return midPointer
        }

        if copyArr[midPointer] < val{
            firstPointer = midPointer + 1
        }else if copyArr[midPointer] > val{
            lastPointer = midPointer - 1
        }
    }
    
    return nil
}

print()
print("Binary Search")
print(BinarySearch(arr: [11, 59, 37, 61, 29, 43, 5, 41, 23], val: 61))

func MaxNumAppearances(arr: [Int]) -> [(Int,Int)]{
    var copyArr = arr
    var amountDict = [Int:Int]()
    
    for num in arr{
        if amountDict[num] != nil{
            amountDict[num]! += 1
        }else{
            amountDict[num] = 1
        }
    }
    
    var mostArr = [(1,0),(1,0)]

    for (key, value) in amountDict{
        if value > mostArr[1].1{
            
            mostArr[0].0 = mostArr[1].0
            mostArr[0].1 = mostArr[1].1
            mostArr[1].0 = key
            mostArr[1].1 = value
        }else if value > mostArr[0].1 && value <= mostArr[1].1{
            mostArr[0].0 = key
            mostArr[0].1 = value
        }else if value < mostArr[0].1{
            continue
        }
    }

    return mostArr
}

print()
print("Max Num Appearance")
print(MaxNumAppearances(arr: [3, 2, 3, 4, 4, 4, 5, 5, 6]))

func DetermineIfTriangle(a: Int, b: Int, c: Int) -> Bool{
    return a+b > c && a+c > b && b+c > a ? true : false
}

print()
print("Determine if a Triangle")
print(DetermineIfTriangle(a: 0, b: 1, c: 1))
print(DetermineIfTriangle(a: 2, b: 3, c: 4))

func ReverseArr<T>(arr: [T]){
    var copyArr = arr
    for i in 0...(copyArr.count-1)/2{
        (copyArr[i], copyArr[copyArr.count-1-i]) = (copyArr[copyArr.count-1-i], copyArr[i])
    }
    print(copyArr)
}

print()
print("Reverse Array")
print(ReverseArr(arr: [11, 59, 37, 61, 29, 43, 5, 41, 23]))

func MultiplesOfThreeOrFive(num: Int) -> Int{
    guard num > 3 else{
        return 0
    }
    var sum = 0
    for index in 2..<num{
        if index % 5 == 0 || index % 3 == 0 {
            sum += index
        }
    }
    return sum
}

print()
print("Multiples of 3 or 5")
print(MultiplesOfThreeOrFive(num: 10))
print(MultiplesOfThreeOrFive(num: 0))
print(MultiplesOfThreeOrFive(num: 1))
print(MultiplesOfThreeOrFive(num: 2))

func ThirdGreatestWord(strArr: [String]) -> String{
    var copyArr = strArr
    for i in 1...copyArr.count-1{
        var currentIndex = copyArr[i]
        var j = i - 1
        while(j >= 0 && currentIndex.count < copyArr[j].count){
            copyArr[j+1] = copyArr[j]
            j -= 1
        }
        copyArr[j+1] = currentIndex
        print(copyArr)
    }
    
    return copyArr[2]
}

print()
print("Third Greatest World")
print(ThirdGreatestWord(strArr:  ["hello", "world", "before", "all"]))
print(ThirdGreatestWord(strArr:  ["mtyyyy", "bt","ctads"]))

func TwoSum(arr: [Int]) -> [Any]{
    let goalVal = arr[0]
    var pairsArr = [Any]()
    
    for index in 1..<arr.count-1{
        var j = index+1
        while(j <= arr.count-1){
            let sum = arr[index] + arr[j]
            if sum == goalVal{
                let pairs = (arr[index], arr[j])
                pairsArr.append(pairs)
            }
            j += 1
        }
    }
    return pairsArr
}

print()
print("Two Sum")
print(TwoSum(arr: [7, 3, 5, 2, -4, 8, 11]))

func PrimeChecker(num: Int) -> Bool{
    guard num > 9 else {
        for numVal in 2..<num{
            if num % numVal == 0{
                return false
            }
        }
        return true
    }
    
    let numString = String(num)
    var arrayIntegers: [String] = numString.characters.flatMap { String($0) }
    print(arrayIntegers)
    
    var first = 0
    var last = arrayIntegers.count - 1
    
    while first <= arrayIntegers.count-1{
        if first != last{
            let temp = arrayIntegers[first+1]
            arrayIntegers[first+1] = arrayIntegers[first]
            arrayIntegers[first] = temp
        }else{
            print(true)
            let temp = arrayIntegers.popLast()
            arrayIntegers.insert(temp!, at: 0)
            print(arrayIntegers)
        }
        
        var numVal = arrayIntegers.joined(separator: "")
        print(numVal)
        if let convertNum = Int(numVal) {
            print(convertNum)
            for numIndex in 2..<convertNum{
                if num % numIndex == 0{
                    print(numIndex)
                    return false
                }
            }
        }
        
        first += 1
    }
    
    return true
}

print()
print("Prime Checker")
print(PrimeChecker(num: 901))
















