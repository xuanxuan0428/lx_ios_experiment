//
//  SecondViewController.swift
//  实验5
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image =  UIImage(named: "zyx")
        view.addSubview(imageView)
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 1000))
        button.setTitle("close Me", for: .normal)
        //        button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Second"
        // Do any additional setup after loading the view.
    }
    @IBAction func btnClicked() {
        //        presentingViewController?.dismiss(animated: true, completion: nil)
        navigationController?.pushViewController(ThirdViewController(), animated: true)
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
