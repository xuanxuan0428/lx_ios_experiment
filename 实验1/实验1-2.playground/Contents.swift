import UIKit

enum Gender:Int{
    case male,female
    static func >(g1: Gender, g2: Gender) -> Bool {
        return g1.rawValue < g2.rawValue
    }
}

class Person{
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender
    var fullName: String{ return firstName + " " + lastName }
    
    init(firstName: String, lastName: String, age: Int, gender: Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(name: String){
        self.init(firstName:name, lastName:"", age:10, gender: Gender.female)
    }
    
    var description: String{
        return "fullName: \(fullName), age: \(age), gender: \(gender)"
    }
    
    static func ==(p1:Person, p2:Person) ->Bool{
        return p1.fullName == p2.fullName
    }
    
    static func !=(p1:Person, p2:Person) ->Bool{
        return p1.fullName != p2.fullName
    }
}

class Student:Person{
    var stuNo: String
    init(firstName: String, lastName: String, age: Int, gender: Gender, stuNo: String){
        self.stuNo = stuNo
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    
    convenience init(name: String, stuNo: String){
        self.init(firstName:name, lastName:"", age:15, gender: Gender.male, stuNo:stuNo)
    }
    
    override var description: String{
        return super.description + " stuNo:\(stuNo)"
    }
}

class Teacher:Person{
    var title:String
    init(firstName:String, lastName:String, age:Int, gender: Gender,title:String){
        self.title = title
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    
    convenience init(name:String, title:String){
        self.init(firstName:name, lastName:"", age:25, gender: Gender.male, title:title)
    }
    
    override var description:String{
        return super.description + " title:\(title)"
    }
}

var p1 = Person(firstName:"liu", lastName:"xuan", age:20, gender: Gender.female)
var p2 = Person(name:"liuhu")
var s1 = Student(firstName:"liu", lastName:"minqi", age:20, gender: Gender.female, stuNo:"2016001")
var t1 = Teacher(firstName:"li", lastName:"guiyang", age:44, gender: Gender.male, title:"IOS")

print(p1.description)
print(p2.description)
print(s1.description)
print(t1.description)

if p1 == p2 {
    print("The same person!")
}

if p1 != p2{
    print("The differ person!")
}

var persons = [p1,p2,s1,t1]
var dictionary = ["Pnumber":0, "Tnumber":0, "Snumber":0]
for i in persons{
    if i is Teacher{
        dictionary["Tnumber"]! += 1
    }
    else if i is Student{
        dictionary["Snumber"]! += 1
    }
    else{
        dictionary["Pnumber"]! += 1
    }
}

for (key,value) in dictionary{
    print("\(key) has \(value)")
}

print("原始数组")
for p in persons {
    print(p.description)
}

print("年龄从小到大排序：")
persons.sort { $0.age < $1.age }
for p in persons {
    print(p.description)
}

print("名字排序：")
persons.sort { $0.fullName < $1.fullName }
for p in persons {
    print(p.description)
}

print("性别以及年龄排序：")
persons.sort { ($0.gender > $1.gender) && ($0.age > $1.age) }
for p in persons {
    print(p.description)
}

