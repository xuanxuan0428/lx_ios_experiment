//
//  ViewController.swift
//  实验11-1
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit
protocol StudentProtocol {
    func change(name: String ,number: String)
}

class ViewController: UIViewController,StudentProtocol{
    func change(name:String,number:String){
        self.name = name
        self.number = number
    }
    
    
    var name = ""
    var number = ""
    
    @IBOutlet var tfnumber: UITextField!
    @IBOutlet var tfname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        tfname.text = name
        tfnumber.text = number
    }
    
    @IBAction func showSecondVc(_ sender: Any) {
        
        number = tfnumber.text!
        name = tfname.text!
        
        let secVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVc") as! SecondViewController
        self.navigationController?.pushViewController(secVc, animated: true)
        secVc.name = name
        secVc.number = number
        secVc.delegate = self
        
    }
    
    @IBAction func showThirdVc(_ sender: Any) {
        let thirdVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdVc")
        present(thirdVc,animated: true,completion: nil)
    }
    
}


