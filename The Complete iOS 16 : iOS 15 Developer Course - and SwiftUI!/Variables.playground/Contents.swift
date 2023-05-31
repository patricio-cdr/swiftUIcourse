import UIKit

//String
var userName = "James"
userName.append("o")
userName.lowercased()
userName.uppercased()

//Integers & Doubles & Floats

//Integers
let userAge = 50
let myAge = 4
userAge / myAge

//Doubles
let userAgeD = 50.0
let myNumberD = 4.0
userAgeD / myNumberD

//Boolean
var myBoolean = false


//Class
var myString : String = "James"
let anotherNumber : Int = 32

//Defined
let myVariable : String

//Initialization
myVariable = "Test"
let myOtherVariable = myVariable.uppercased()
print(myOtherVariable)
print(myVariable)


//Array
var favoriteMovies = ["Sisu", "Harry Potter", "The Godfather", 3, true] as [Any]

//as -> casting
//any -> any object

//index
favoriteMovies[0]
favoriteMovies[4]

var myStringArray = ["test1", "test3", "test7", "test4"]
myStringArray.sort()

var myNumberArray = [1,2,3,4,3,2,1]
myNumberArray[0]

//Set
var mySet : Set = [1,2,3,4,3,2,1]
mySet.first
mySet

var myNumberSet = Set(myNumberArray)
var mySet1 : Set = [1,2,3]
var mySet2 : Set = [4,5,6]

var mySet3 = mySet1.union(mySet2)

//Dictionary
//Key-value pairing

var favoriteDirectors = ["Pulp Fiction" : "Taratino", "Lock" : "Guy Ritchie", "Batman" : "Nolan"]

favoriteDirectors["Pulp Fiction"]
favoriteDirectors["Batman"]

favoriteDirectors["Pulp Fiction"] = "Quentin Tarantino"
favoriteDirectors["Seven Samurai"] = "Akira"
print(favoriteDirectors)

var myDictionary = ["Run" : 100, "Swim" : 200,"Basket" : 300]

//Loops

//While loop
var aNumber = 1

while aNumber <= 10 {
    print(aNumber)
    aNumber += 1
}
    
var charaterAlive = true

while charaterAlive == true {
    print("character alive")
    charaterAlive = false
}

//For loop
var myFruitArray = ["Banana","Apple","Orange"]

for fruit in myFruitArray {
    print(fruit)
}

var myNumberArr = [10,20,30,40,50]
for number in myNumberArr {
    print(number/5)
}

for myNewInt in 1...5 {
    print(myNewInt*5)
}

//Functions
func myFunction() {
    print("my function")
}

print("print")
myFunction()

//Input & Outputs & Return
func sumFunc(x: Int, y: Int) -> Int {
    return x + y
}

let myFuncVariable = sumFunc(x: 2, y: 3)
print(myFuncVariable)

func logicFunction(a: Int, b: Int) -> String {
    if a > b {
        return "Greater"
    } else {
        return "Smaller"
    }
}

logicFunction(a: 10, b: 0)

//Optionals
var myName : String?
myName?.uppercased()

//optionals : ? vs !
var myAgeNew = "5"
var myNameNew = "Pat"
Int(myNameNew)

var myIntNew1 = (Int(myAgeNew) ?? 0) * 5
var myIntNew2 = (Int(myNameNew) ?? 0) * 5

if let myNumberNew = Int(myNameNew) {
    print(myNumberNew * 5)
} else {
    print("wrong input")
}
