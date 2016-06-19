//
//  TutorialViewController.swift
//  CollectionViewCode
//
//  Created by S.ONO on 2016/01/24.
//  Copyright © 2016年 KFCC. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var scrollPage: UIScrollView!
    var pageControl: UIPageControl!
    var startButton = UIButton()
    var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aiu")
        let pageSize = 6
        
        let tImageArray:[String] = ["Tutorial2.png","Tutorial3.png","Tutorial4.png","Tutorial5.png","Tutorial6.png","Tutorial7.png"]

        startButton.frame = CGRectMake(self.view.frame.width*(62.5/12), self.view.frame.height*(90/100), self.view.frame.width*(3/5), self.view.frame.height*(1/12))
        
        startButton.setTitle("Let's Start!", forState: .Normal)
        startButton.backgroundColor = UIColor.redColor()
        startButton.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
        
        scrollPage = UIScrollView()
        scrollPage.contentSize = CGSizeMake(self.view.frame.width*6, self.view.frame.height)
        scrollPage.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        scrollPage.backgroundColor = UIColor.blackColor()
        self.view.addSubview(scrollPage)
        
        for var i = 0; i < pageSize; i = i+1 {
            let img: UIImage = UIImage(named:tImageArray[i])!
            imgView = UIImageView(image: img)
            imgView.frame = CGRectMake(self.view.frame.width*CGFloat(i), 0, self.view.frame.width, self.view.frame.height)
            scrollPage.addSubview(imgView)
        }
        
        //UIPageControllの作成
        pageControl = UIPageControl(frame: CGRectMake(0, self.view.frame.maxY - 50, self.view.frame.width, 50))
        pageControl.backgroundColor = UIColor.grayColor()
        pageControl.numberOfPages = pageSize
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        self.view.addSubview(pageControl)
        
        scrollPage.addSubview(startButton)
        
        scrollPage.pagingEnabled = true
        scrollPage.directionalLockEnabled = true
        scrollPage.showsVerticalScrollIndicator = false
        scrollPage.bounces = false
        scrollPage.alwaysBounceVertical = false
        
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(scrollview: UIScrollView) {
        print("test")
            // スクロール数が1ページ分になったら時.
            if fmod(scrollPage.contentOffset.x, scrollPage.frame.maxX) == 0 {
            // ページの場所を切り替える.
            pageControl.currentPage = Int(scrollPage.contentOffset.x / scrollPage.frame.maxX)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func start() {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
