//
//  SecondViewController.swift
//  实验11-1
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name = ""
    var number = ""
    var delegate: StudentProtocol?
    @IBOutlet var tfnumber: UITextField!
    @IBOutlet var tfname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfname.text = name
        tfnumber.text = number
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        number = tfnumber.text!
        name = tfname.text!
        
        delegate?.change(name:name,number:number)
        
        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

