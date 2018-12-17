//
//  DetailViewController.swift
//  实验12-2
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person:Person?
    
    @IBOutlet weak var stuNoLB: UILabel!
    @IBOutlet weak var stuNameLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stuNoLB.text = person?.stuNo
        stuNameLB.text = person?.stuName
        // Do any additional setup after loading the view.
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

