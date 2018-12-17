//
//  ViewController.swift
//  实验13-2
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://www.baidu.com") {
            webView.load(URLRequest(url: url))
            webView.navigationDelegate = self
            webView.uiDelegate = self
            webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (title, error) in
            if let title = title as? String {
                self.title = title
            }
        }
        webView.evaluateJavaScript("ocToJs('test','i hate you')", completionHandler: {(response, error) in
            print("response:\((response as? String) ?? "") error:\(error?.localizedDescription ?? "")")
        })
        webView.evaluateJavaScript("showAlert()", completionHandler: {(response, error) in
            print("response:\((response as? String) ?? "") error:\(error?.localizedDescription ?? "")")
        })
        
        print("Finished!")
    }
    
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: tfUrl.text ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    @IBAction func local(_ sender: Any) {
        if let url = Bundle.main.url(forResource: "default", withExtension: "html") {
            //            webView.load(URLRequest(url: url))
            webView.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            completionHandler()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            completionHandler(false)
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        let alert = UIAlertController(title: prompt, message: nil, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.text = defaultText
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            completionHandler(alert.textFields?.first?.text ?? "nil")
        }))
        present(alert, animated: true, completion: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.alpha = 1
            progressView.progress = Float(webView.estimatedProgress)
            if progressView.progress == 1 {
                progressView.progress = 0
                progressView.alpha = 0
            }
        }
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}


