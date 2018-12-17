//
//  ViewController.swift
//  实验12-2
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var stuNoTF: UITextField!
    @IBOutlet weak var stuNameTF: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
    }
    
    @IBAction func add(_ sender: Any) {
        let person = Person(context: context)
        person.stuNo = stuNoTF.text
        person.stuName = stuNameTF.text
        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func remove(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "stuNo=%@", stuNoTF.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            appDelegate.saveContext()
        }
    }
    @IBAction func query(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "stuNo=%@", stuNoTF.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            stuNameTF.text = p.stuName
        }
    }
    @IBAction func update(_ sender: Any) {
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        fetch.predicate = NSPredicate(format: "stuNo=%@", stuNoTF.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.stuName = stuNameTF.text
            appDelegate.saveContext()
        }
    }
}


