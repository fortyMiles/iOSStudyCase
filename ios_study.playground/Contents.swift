//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let s = "howdy"

for (ix, c) in enumerate(s){
    println("character \(ix) is \(c)")
}

var pais = (1, "One")

println(pais)

pais.0 = 2

println(pais)

var pair:(first: Int, name: String) = (1, "One")


func realStringExceptor(s: String){println(s)}

var stringOptional:String! = "howdy"
realStringExceptor(stringOptional)

var string: String?

if string != nil{
    let s = string!
    println("It's nil")
}else{
    println("It's not ")
}

let i : Int? = 2

if i < 3{
    println("test")
}

let v = UIView()
let c = v.backgroundColor
let c2 = c?.colorWithAlphaComponent(0.5)

class Test{
    var name:String = "None"
    static var age = 10
}

enum Error{
    case Number(Int)
    case Message(String)
    case Fatal(n:Int, s:String)
}

let err : Error = .Number(4)

switch err{
case .Number(let theNumber):
    println("number: \(theNumber)")
case .Message(let message):
    println("the message: \(message)")
case .Fatal(let theNumber, let theMessage):
    println("number:\(theNumber), message: \(theMessage)")
}

class Dog{
    func bark(){
        println("woo")
    }
}

func bark(){
    println("print")
}



class NosiyDoy: Dog{
    override func bark() {
        super.bark()
        super.bark()
    }
    func beQuiet(){
        self.bark()
    }
}


func tellToHush(d: Dog){
    let d2 = d as!  NosiyDoy
    d2.beQuiet()
    d2.beQuiet()
    println("1+1")
}

let d: NosiyDoy = NosiyDoy()
tellToHush(d)

let dog = Dog()

dog.bark()

bark()

class Student {
    func say(){
        println("hello")
    }
}

var ming = Student()

ming.say()










