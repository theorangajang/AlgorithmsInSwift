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

//print()
//print("Reverse String")
//print(ReverseString(str: "hello"));
//print()

func Fibonacci(num: Int) -> Int{
    if(num <= 2){
        return 1
    }else{
        return Fibonacci(num: num-1) + Fibonacci(num: num-2)
    }
}

//print()
//print("Fibonacci")
//print(Fibonacci(num: 7))
//print()

func Factorial(num: Int) -> Int{
    if(num == 1 || num == 0){
        return 1
    }else{
        return num * Fibonacci(num: num-1)
    }
}

//print()
//print("Factorial")
//print(Factorial(num: 7))
//print()

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

//print()
//print("Binary Sort")
//print(BinarySort(arr: [0, 1, 0, 1, 1, 0, 1, 0]))
//print()

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

//print()
//print("Counting Brackets")
//print(CountBrackets(str: "(())()"))
//print(CountBrackets(str: "(())("))
//print()

func Palindrome(str: String) -> Bool{
    var reversed = ""
    
    for character in str.characters{
        //this is similar to the push method for an array in js
        reversed.insert(character, at: str.startIndex)
    }
    
    return reversed == str
}

//print()
//print("Palindrome")
//print(Palindrome(str: "hannah"))
//print(Palindrome(str: "hanabaeh"))
//print()

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

//print()
//print("Longest String")
//print(LongestString(str: "find the longest word in the problem description"))

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

//print()
//print("Insertion Sort")
//print(InsertionSort(arr: [0,9,2,8,4,3,7,5]))

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

//print()
//print("Selection Sort")
//print(SelectionSort(arr: [0,9,2,8,4,3,7,5]))

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

//print()
//print("Binary Search")
//print(BinarySearch(arr: [11, 59, 37, 61, 29, 43, 5, 41, 23], val: 61))

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

//print()
//print("Max Num Appearance")
//print(MaxNumAppearances(arr: [3, 2, 3, 4, 4, 4, 5, 5, 6]))

func DetermineIfTriangle(a: Int, b: Int, c: Int) -> Bool{
    return a+b > c && a+c > b && b+c > a ? true : false
}

//print()
//print("Determine if a Triangle")
//print(DetermineIfTriangle(a: 0, b: 1, c: 1))
//print(DetermineIfTriangle(a: 2, b: 3, c: 4))

func ReverseArr<T>(arr: [T]){
    var copyArr = arr
    for i in 0...(copyArr.count-1)/2{
        (copyArr[i], copyArr[copyArr.count-1-i]) = (copyArr[copyArr.count-1-i], copyArr[i])
    }
    print(copyArr)
}

//print()
//print("Reverse Array")
//print(ReverseArr(arr: [11, 59, 37, 61, 29, 43, 5, 41, 23]))

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

//print()
//print("Multiples of 3 or 5")
//print(MultiplesOfThreeOrFive(num: 10))
//print(MultiplesOfThreeOrFive(num: 0))
//print(MultiplesOfThreeOrFive(num: 1))
//print(MultiplesOfThreeOrFive(num: 2))

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

//print()
//print("Third Greatest World")
//print(ThirdGreatestWord(strArr:  ["hello", "world", "before", "all"]))
//print(ThirdGreatestWord(strArr:  ["mtyyyy", "bt","ctads"]))

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

//print()
//print("Two Sum")
//print(TwoSum(arr: [7, 3, 5, 2, -4, 8, 11]))

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
            let temp = arrayIntegers.popLast()
            arrayIntegers.insert(temp!, at: 0)
        }
        
        var numVal = arrayIntegers.joined(separator: "")
        if let convertNum = Int(numVal) {
            for numIndex in 2..<convertNum{
                if num % numIndex == 0{
                    return false
                }
            }
        }
        
        first += 1
    }
    
    return true
}

//print()
//print("Prime Checker")
//print(PrimeChecker(num: 901))

func ThreeSum(arr: [Int]) -> Bool{
    var copyArr = arr
    let mainVal = copyArr.removeFirst()
    for i in 1...copyArr.count-1{
        var temp = copyArr[i]
        var j = i
        while j > 0 && temp <= copyArr[j-1]{ //order of coditions matter***
            copyArr[j] = copyArr[j-1]
            j -= 1
        }
        copyArr[j] = temp
    }
    
    for k in 0...copyArr.count-2{
        let currentVal = copyArr[k]
        var firstPointer = k+1
        var lastPointer = copyArr.count-1
        
        while firstPointer < lastPointer{
            let sum = currentVal+copyArr[firstPointer]+copyArr[lastPointer]
            if sum < mainVal{
                firstPointer += 1
            }else if sum > mainVal{
                lastPointer -= 1
            }else if sum == mainVal{
                print("current: \(currentVal) firstPointer: \(copyArr[firstPointer]) lastPointer \(copyArr[lastPointer])")
                return true
            }
        }
    }
    
    return false
}

//print()
//print("Three Sum")
//print(ThreeSum(arr: [8, 2, 1, 4, 10, 5, -1, -1]))

public class Node<T> {
    var data: T?
    var next: Node?
}

public class LinkedList<T: Equatable>{
    var head = Node<T>()
    
    func printAllKeys() {
        var LLString = ""
        var current: Node! = self.head
        while current != nil && current.data != nil {
            LLString.append("\(current.data!) -> ")
            current = current.next
        }
        LLString.append("nil")
        print(LLString)
    }
    
    func addFirst(data: T){
        var newNode = Node<T>()
        newNode.data = data
        newNode.next = head
        head = newNode
    }
    
    func add(data: T){
        if head.data == nil{
            self.head.data = data
            return;
        }else{
            var currentNode = self.head
            while currentNode.next != nil{
                currentNode = currentNode.next!
            }
            let newNode = Node<T>()
            newNode.data = data
            currentNode.next = newNode
        }
    }
    
    func removeNode(atIndex: Int){
        
        if atIndex == 0{
            head.data = nil
            return;
        }else{
            var currentIndex = 0
            var currentNode = head
            var prevNode = Node<T>()
            
            while currentIndex < atIndex && currentNode.next != nil{
                prevNode = currentNode
                currentNode = currentNode.next!
                currentIndex += 1
            }
            
            if currentNode.next != nil{
                prevNode.next = currentNode.next
            }else{
                prevNode.next = nil
            }
        }
    }
}

//print()
//print()
//print("Linked List")
//var LL = LinkedList<Int>()
//LL.add(data: 3)
//LL.add(data: 4)
//LL.add(data: 5)
//LL.add(data: 6)
//LL.printAllKeys()
//LL.removeNode(atIndex: 2)
//LL.removeNode(atIndex: 2)
//LL.addFirst(data: 1)
//LL.addFirst(data: 2)
//LL.printAllKeys()

func addDashes(_ dashString: String) -> String{
    guard dashString.count > 1 else {
        return dashString
    }
    
    var copyStr = Array(dashString)
    var newStr = ""
    var i = 0
    
    while i < copyStr.count-1{
        if let currentVal = Int(String(copyStr[i])){
            newStr += String(currentVal)
            if let nextVal = Int(String(copyStr[i+1])){
                if currentVal % 2 != 0 && nextVal % 2 != 0{
                    newStr += "-"
                }
            }
        }
        i += 1
    }
    
    if let nextVal = Int(String(copyStr[i])){
        newStr += String(nextVal)
    }
    
    return newStr
}

//print(addDashes("52351hello3455"))

func evenPair(_ str: String) -> Bool{
    guard str.count > 1 else {
        return false
    }
    var copyStr = Array(str)
    var i = 0
    
    while i < copyStr.count-1{
        var j = i+1
        if let currentVal = Int(String(copyStr[i])){
            if currentVal % 2 == 0{
                var nextNum = String(copyStr[j])
                while(Int(nextNum) != nil){
                    let numVal = Int(nextNum)!
                    if numVal % 2 == 0{
                        print("did find pair!")
                        return true
                    }
                    
                    j += 1
                    
                    if j > copyStr.count-1{
                        break
                    }else{
                        nextNum += String(copyStr[j])
                    }
                }
                
            }
        }
        i += 1
    }
    print("didn't find pair!")
    return false
}

//evenPair("3gy41d216")
//evenPair(")7r5gg812")
//evenPair("f09r27i8e67")
//evenPair("86")

func bitToInt(_ bit: Int){
    var intArr = Array(String(bit))
    var total: Double = 0
    
    for i in stride(from: intArr.count-1, through: 0, by: -1){
        total += intArr[i] == "1" ? pow(2, Double(6-i)) : 0
    }
    print(total)
}

//bitToInt(1000101)

func bitWiseTwo(_ bit: [String]) -> String{
    let first = bit[0]
    let second = bit[1]
    var finalStr = ""
    
    for i in first.indices{
        if first[i] == "1" && second[i] == "1"{
            finalStr += "1"
        }else{
            finalStr += "0"
        }
    }
    
    return finalStr
}

//bitWiseTwo(["10100", "11100"])

func arrayAddition(_ arr: [Int]) -> Bool{
    
    guard arr.count > 2 else {
        return false
    }
    
    var copyArr = arr
    for i in 1...copyArr.count-1{
        
        var currentVal = copyArr[i]
        var j = i
        
        while j > 0 && currentVal < copyArr[j-1]{
            copyArr[j] = copyArr[j-1]
            j -= 1
        }
        copyArr[j] = currentVal
    }
    
    let greatestVal = copyArr.popLast()
    
    for j in 0..<copyArr.count-1{
        var sum = copyArr[j]
        var k = j+1
        while k <= copyArr.count-1 {
            sum += copyArr[k]
            if sum == greatestVal{
                print("found sum")
                return true
            }
            k += 1
        }
    }
    print("did not find sum")
    return false
}

//arrayAddition([4, 6, 23, 10, 1, 3])
arrayAddition([10,20,30,40,100])
arrayAddition([10,12,500,1,-5,1,0])
arrayAddition([2,6,18])

















