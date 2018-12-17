//
//  ViewController.swift
//  实验9-3
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 刘宣. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollViewTop: UIScrollView!
    @IBOutlet weak var scrollViewBottom: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScrollViewTop()
        loadBScrollViewottom()
        
    }
    
    func loadScrollViewTop() {
        
        scrollViewTop.delegate = self
        
        let imageView = UIImageView(image: UIImage(named: "1"))
        imageView.contentMode = .scaleAspectFit
        scrollViewTop.addSubview(imageView)
        
        scrollViewTop.contentSize = imageView.bounds.size
        scrollViewTop.minimumZoomScale = 0.2
        scrollViewTop.maximumZoomScale = 5
        scrollViewTop.showsHorizontalScrollIndicator = false
        scrollViewTop.showsVerticalScrollIndicator = false
        
    }
    
    func loadBScrollViewottom() {
        scrollViewBottom.delegate  = self
        
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollViewBottom.bounds.width, y: 0, width: scrollViewBottom.bounds.width, height: scrollViewBottom.bounds.height)
            scrollViewBottom.addSubview(imageView)
        }
        
        scrollViewBottom.contentSize = CGSize(width: scrollViewBottom.bounds.width * 7, height: scrollViewBottom.bounds.height)
        scrollViewBottom.isPagingEnabled = true
        scrollViewBottom.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollViewTop.subviews.first
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollViewBottom.contentOffset.x/scrollViewBottom.bounds.width
        pageControl.currentPage = Int(currentPage)
    }
    
    @IBAction func pageControlCilcked(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollViewBottom.bounds.width, y: 0, width: scrollViewBottom.bounds.width, height: scrollViewBottom.bounds.height)
        scrollViewBottom.scrollRectToVisible(rect, animated: true)
    }
    
}
