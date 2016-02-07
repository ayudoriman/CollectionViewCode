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
    let ImageView1 = UIImageView()
    let ImageView2 = UIImageView()
    let ImageView3 = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aiu")

        let tutorialImage1 = UIImage(named: "OriginPhoto.png")
        let tutorialImage2 = UIImage(named: "Cancel.png")
        let tutorialImage3 = UIImage(named: "screw.png")

        ImageView1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView2.frame = CGRect(x: self.view.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        ImageView3.frame = CGRect(x: self.view.frame.width*2, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        
        ImageView1.image = tutorialImage1
        ImageView2.image = tutorialImage2
        ImageView3.image = tutorialImage3
        
        scrollPage = UIScrollView()
        scrollPage.contentSize = CGSizeMake(self.view.frame.width*3+10, self.view.frame.height)
        scrollPage.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-20)
        scrollPage.backgroundColor = UIColor.blackColor()
        self.view.addSubview(scrollPage)
        
        scrollPage.addSubview(ImageView1)
        scrollPage.addSubview(ImageView2)
        scrollPage.addSubview(ImageView3)
        
        
        
        scrollPage.pagingEnabled = true
        scrollPage.alwaysBounceVertical = false
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
