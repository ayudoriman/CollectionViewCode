//
//  SubViewController.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/11/08.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    var firstViewController: ViewController!
    
    var bgViewU: UIView!
    
    var sDate: String!
    
    var backButton: UIButton!
    
    var placeLabel: UILabel!
    var peopleLabel: UILabel!
    var commentLabel: UILabel!
    
    var imageView: UIImageView!
    var commentBg: UIImageView!
    var locationIcon: UIImageView!
    var faceIcon: UIImageView!
    
    var faceName = ["BasicFace.png","SadFace.png","HappyFace.png","UpsetFace.png","BoringFace.png","ConfusingFace.png","WonderFace.png"]
    var colorArray = [  UIColor.grayColor(),
                        UIColor(red:88/255, green: 163/255, blue: 1, alpha: 0.98),
                        UIColor(red: 1, green: 88/255, blue: 131/255, alpha:0.98),
                        UIColor.redColor(),
                        UIColor.yellowColor(),
                        UIColor.greenColor(),
                        UIColor(red: 1, green: 161/255, blue: 26/255, alpha:1.0)]
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    let commentUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("送られてきた日付は、\(sDate)です。")
        
        let dic = userDefaults.objectForKey(sDate) as! NSDictionary
        let comment: String! = dic.valueForKey("comment") as! String
        let place: String! = dic.valueForKey("place") as! String
        let face: Int! = dic.valueForKey("face") as! Int
        let imageData: NSData! = dic.valueForKey("image") as! NSData
        
        //半透明の背景 上層
        bgViewU = UIView()
        bgViewU.frame.size = CGSize(width: self.view.frame.width*(8/9), height: self.view.frame.height*(3/4))
        bgViewU.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        bgViewU.backgroundColor = colorArray[face]
        bgViewU.layer.cornerRadius = 10
        view.addSubview(bgViewU)
        
        //写真表示
        let image = UIImage(data: imageData!)
        imageView = UIImageView()
        imageView.frame.size = CGSize(width: self.view.frame.width*(8/9), height: self.view.frame.height*(3/8))
        imageView.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(3/8))
        imageView.image = image!
        view.addSubview(imageView)
        
        
        //場所ラベル
        placeLabel = UILabel()
        placeLabel.frame.size = CGSize(width: self.view.frame.width*(43/100), height: self.view.frame.width/12)
        placeLabel.center = CGPoint(x: self.view.frame.width*(62/100), y: self.view.frame.height*(75/100))
        placeLabel.textAlignment = NSTextAlignment.Center
        placeLabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        view.addSubview(placeLabel)
        
        //場所アイコン
        locationIcon = UIImageView()
        locationIcon.frame.size = CGSize(width: self.view.frame.width*(1/22), height: self.view.frame.width*(1/12))
        locationIcon.center = CGPoint(x: self.view.frame.width*(40/100), y: self.view.frame.height*(75/100))
        locationIcon.image = UIImage(named: "location.png")
        view.addSubview(locationIcon)
        
        //コメント背景
        commentBg = UIImageView()
        commentBg.frame.size = CGSize(width: self.view.frame.width*(67/100), height: (self.view.frame.height/12)+5)
        commentBg.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(65/100))
        commentBg.image = UIImage(named: "comment.png")
        view.addSubview(commentBg)
        
        //コメントラベル
        commentLabel = UILabel()
        commentLabel.frame.size = CGSize(width: self.view.frame.width*(67/100), height: self.view.frame.width/12)
        commentLabel.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(67/100))
        commentLabel.backgroundColor = UIColor.whiteColor()
        commentLabel.textAlignment = NSTextAlignment.Center
        view.addSubview(commentLabel)

        //顔ボタン
        faceIcon = UIImageView()
        faceIcon.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        faceIcon.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(58/100))
        faceIcon.image = UIImage(named: "BasicFace.png")
        view.addSubview(faceIcon)
        
        //ウェルカム画面に戻る
        backButton = UIButton()
        backButton.frame.size = CGSize(width: self.view.frame.height*(1/7), height: self.view.frame.height*(1/7))
        backButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(86/100))
        backButton.addTarget(self, action: "backToFirstView", forControlEvents: .TouchUpInside)
        backButton.setImage(UIImage(named: "Cancel.png"), forState: .Normal)
        view.addSubview(backButton)
        
        
        commentLabel.text = comment
        placeLabel.text = place
        print("hoge")
        faceIcon.image = UIImage(named: faceName[face])
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func backToFirstView() {
        dismissViewControllerAnimated(true, completion: nil)
       // firstViewController.bgViewB.removeFromSuperview()
    }
}
