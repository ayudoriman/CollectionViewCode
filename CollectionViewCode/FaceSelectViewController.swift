//
//  FaceSelectViewController.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/12/06.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

//①プロトコルの宣言
@objc protocol FaceSelectViewControllerDelegate {
    func didTapFaceButton(faceNum: Int)
}

class FaceSelectViewController: UIViewController {
    var sadFace: UIButton!
    var happyFace: UIButton!
    var upsetFace: UIButton!
    var add: AddViewController!
    
//    ②delegateプロパティの定義
    weak var delegate: FaceSelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //悲しい顔ボタン
        sadFace = UIButton()
        sadFace.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        sadFace.center = CGPoint(x: self.view.frame.width*(1/4), y: self.view.frame.height*(58/100))
        sadFace.setImage(UIImage(named: "SadFace.png"), forState: .Normal)
        sadFace.addTarget(self, action: "sadFaceData", forControlEvents: .TouchUpInside)
        view.addSubview(sadFace)
        
        //楽しい顔ボタン
        happyFace = UIButton()
        happyFace.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        happyFace.center = CGPoint(x: self.view.frame.width*(2/4), y: self.view.frame.height*(58/100))
        happyFace.setImage(UIImage(named: "HappyFace.png"), forState: .Normal)
        happyFace.addTarget(self, action: "happyFaceData", forControlEvents: .TouchUpInside)
        view.addSubview(happyFace)
        
        //おこってる顔ボタン
        upsetFace = UIButton()
        upsetFace.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        upsetFace.center = CGPoint(x: self.view.frame.width*(3/4), y: self.view.frame.height*(58/100))
        upsetFace.setImage(UIImage(named: "UpsetFace.png"), forState: .Normal)
        upsetFace.addTarget(self, action: "upsetFaceData", forControlEvents: .TouchUpInside)
        view.addSubview(upsetFace)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sadFaceData() {
        
        //③デリゲートメソッドの呼び出し
        self.delegate?.didTapFaceButton(1)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func happyFaceData() {
        self.delegate?.didTapFaceButton(2)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func upsetFaceData() {
        self.delegate?.didTapFaceButton(3)
        dismissViewControllerAnimated(true, completion: nil)
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
