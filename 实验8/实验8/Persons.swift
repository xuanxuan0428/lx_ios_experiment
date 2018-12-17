//
//  Persons.swift
//  实验8
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import Foundation

enum Gender:Int{
    case male = 1
    case female = 2
}
enum Department:Int{
    case east = 1
    case west = 2
}
protocol SchoolProtocol {
    var department:Department{get set}
    func lendbook()
}

//Person
class Person: CustomStringConvertible {
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String {
        return "\(firstName)\(lastName)"
    }
    
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName:String,lastName:String) {
        self.init(firstName: firstName, lastName: lastName, age: 0, gender: Gender.male)
    }
    var description:String {
        return "Name:\(fullName) Age:\(age) gender:\(gender)"
    }
    func run() {
        print("Person \(fullName) is running")
    }
}
func == (left:Person,right:Person) -> Bool {
    return (left.firstName==right.firstName) && (left.lastName==right.lastName)
        && (left.age==right.age) && (left.gender==right.gender)
}
func != (left:Person,right:Person) -> Bool {
    return !(left==right)
}

// Teacher
class Teacher : Person,SchoolProtocol {
    var title:String = ""
    var department:Department = Department.west
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description:String {
        return "Name:\(fullName) Age:\(age) gender:\(gender) title:\(title)"
    }
    override func run() {
        print("Teacher \(fullName) is running")
    }
    func lendbook() {
        let type1 = type(of:self)
        print("\(type1) \(fullName) lendbook")
    }
}

//Student
class Student : Person,SchoolProtocol {
    var stuNo:String = ""
    var department:Department = Department.east
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description:String {
        return "Name:\(fullName) Age:\(age) gender:\(gender) stuNo:\(stuNo)"
    }
    override func run() {
        print("Student \(fullName) is running")
    }
    func lendbook() {
        let type1 = type(of:self)
        print("\(type1) \(fullName) lendbook")
    }
}
