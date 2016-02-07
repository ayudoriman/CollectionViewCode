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
    var startButton = UIButton()
    let ImageView1 = UIImageView()
    let ImageView2 = UIImageView()
    let ImageView3 = UIImageView()
    let ImageView4 = UIImageView()
    let ImageView5 = UIImageView()
    let ImageView6 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aiu")
        
        let tutorialImage1 = UIImage(named: "Tutorial2.png")
        let tutorialImage2 = UIImage(named: "Tutorial3.png")
        let tutorialImage3 = UIImage(named: "Tutorial4.png")
        let tutorialImage4 = UIImage(named: "Tutorial5.png")
        let tutorialImage5 = UIImage(named: "Tutorial6.png")
        let tutorialImage6 = UIImage(named: "Tutorial7.png")

        ImageView1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        ImageView2.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView3.frame = CGRect(x: self.view.frame.width*2, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView4.frame = CGRect(x: self.view.frame.width*3, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView5.frame = CGRect(x: self.view.frame.width*4, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView6.frame = CGRect(x: self.view.frame.width*5, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        startButton.frame = CGRectMake(self.view.frame.width*(62.5/12), self.view.frame.height*(90/100), self.view.frame.width*(3/5), self.view.frame.height*(1/12))
        
        ImageView1.image = tutorialImage1
        ImageView2.image = tutorialImage2
        ImageView3.image = tutorialImage3
        ImageView4.image = tutorialImage4
        
        ImageView5.image = tutorialImage5
        ImageView6.image = tutorialImage6
        
        startButton.setTitle("Let's Start!", forState: .Normal)
        startButton.backgroundColor = UIColor.redColor()
        startButton.addTarget(self, action: "start", forControlEvents: .TouchUpInside)
        
        scrollPage = UIScrollView()
        scrollPage.contentSize = CGSizeMake(self.view.frame.width*6, self.view.frame.height)
        scrollPage.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        scrollPage.backgroundColor = UIColor.blackColor()
        self.view.addSubview(scrollPage)
        
        scrollPage.addSubview(ImageView1)
        scrollPage.addSubview(ImageView2)
        scrollPage.addSubview(ImageView3)
        scrollPage.addSubview(ImageView4)
        scrollPage.addSubview(ImageView5)
        scrollPage.addSubview(ImageView6)
        scrollPage.addSubview(startButton)
        
        scrollPage.pagingEnabled = true
        scrollPage.directionalLockEnabled = true
        scrollPage.showsVerticalScrollIndicator = false
        scrollPage.bounces = false
        scrollPage.alwaysBounceVertical = false
        
        
        // Do any additional setup after loading the view.
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
