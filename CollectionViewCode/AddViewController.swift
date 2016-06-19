//
//  AddViewController.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/11/08.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

//④プロトコルの採用
class AddViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, FaceSelectViewControllerDelegate {
    var firstViewController: ViewController!
    
    var bgViewU: UIView!
    
    var testButton: UIButton!
    
    var photoButton: UIButton!
    var faceButton: UIButton!
    var backButton: UIButton!
    var doneButton: UIButton!
    var placeField: UITextField!
    var peopleField: UITextField!
    var commentField: UITextField!
    
    var addScroll: UIScrollView!

    var commentBg: UIImageView!
    var photoView: UIImageView!
    var locationIcon: UIImageView!
    
    var photoData: NSData!
    
    var faceNumber: Int = 0
    var faceName = ["BasicFace.png","SadFace.png","HappyFace.png","UpsetFace.png","BoringFace.png","ConfusingFace.png","WonderFace.png"]
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //notificationCenterにキーボードの出入りを記録
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "handleKeyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "handleKeyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
        
        addScroll = UIScrollView()
        addScroll.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        addScroll.contentOffset.y = 0
        view.addSubview(addScroll)
        
        //半透明の背景 上層
        bgViewU = UIView()
        bgViewU.frame.size = CGSize(width: self.view.frame.width*(8/9), height: self.view.frame.height*(3/4))
        bgViewU.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(47/100))
        bgViewU.layer.cornerRadius = 10
        bgViewU.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.94)
        
        addScroll.addSubview(bgViewU)
        
        //写真
        photoView = UIImageView()
        photoView.frame.size = CGSize(width: self.view.frame.width*(8/9), height: self.view.frame.height*(3/8))
        photoView.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(3/8))
        photoView.image = UIImage(named: "OriginPhoto.png")
        addScroll.addSubview(photoView)
        
        //写真選択ボタン
        photoButton = UIButton()
        photoButton.frame.size = CGSize(width: self.view.frame.width/7, height: self.view.frame.height/15)
        photoButton.center = CGPoint(x: self.view.frame.width*(85/100), y: self.view.frame.height*(52/100))
        photoButton.setImage(UIImage(named: "addImage.png"), forState: .Normal)
        photoButton.addTarget(self, action: "photoSelectButtonTouchDown:", forControlEvents: .TouchUpInside)
        addScroll.addSubview(photoButton)
        
        //場所入力フィールド
        placeField = UITextField()
        placeField.frame.size = CGSize(width: self.view.frame.width*(43/100), height: self.view.frame.width/12)
        placeField.center = CGPoint(x: self.view.frame.width*(62/100), y: self.view.frame.height*(75/100))
        placeField.backgroundColor = UIColor.whiteColor()
        placeField.textAlignment = NSTextAlignment.Center
        placeField.placeholder = "Add place"
        addScroll.addSubview(placeField)
        
        //場所アイコン
        locationIcon = UIImageView()
        locationIcon.frame.size = CGSize(width: self.view.frame.width*(1/22), height: self.view.frame.width*(1/12))
        locationIcon.center = CGPoint(x: self.view.frame.width*(40/100), y: self.view.frame.height*(75/100))
        locationIcon.image = UIImage(named: "location.png")
        addScroll.addSubview(locationIcon)
        
        //コメント入力背景
        commentBg = UIImageView()
        commentBg.frame.size = CGSize(width: self.view.frame.width*(67/100), height: (self.view.frame.height/12)+5)
        commentBg.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(65/100))
        commentBg.image = UIImage(named: "comment.png")
        addScroll.addSubview(commentBg)
        
        //コメント入力フィールド
        commentField = UITextField()
        commentField.frame.size = CGSize(width: self.view.frame.width*(67/100), height: self.view.frame.width/12)
        commentField.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(67/100))
        commentField.backgroundColor = UIColor.whiteColor()
        commentField.textAlignment = NSTextAlignment.Center
        commentField.placeholder = "Add comments"
        addScroll.addSubview(commentField)
        
        //顔ボタン
        faceButton = UIButton()
        faceButton.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        faceButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(58/100))
        faceButton.setImage(UIImage(named: faceName[faceNumber]), forState: .Normal)
        faceButton.addTarget(self, action: "faceSelector", forControlEvents: .TouchUpInside)
        addScroll.addSubview(faceButton)
        
        //ウェルカム画面に戻る
        backButton = UIButton()
        backButton.frame.size = CGSize(width: self.view.frame.height*(1/10), height: self.view.frame.height*(1/10))
        backButton.center = CGPoint(x: self.view.frame.width*(85/100), y: self.view.frame.height*(14/100))
        backButton.addTarget(self, action: "backToFirstView", forControlEvents: .TouchUpInside)
        backButton.setImage(UIImage(named: "Cancel.png"), forState: .Normal)
        addScroll.addSubview(backButton)
        
        //完了ボタン
        doneButton = UIButton()
        doneButton.frame.size = CGSize(width: 70, height: 70)
        doneButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(17/20))
        doneButton.addTarget(self, action: "saveHistory", forControlEvents: .TouchUpInside)
        doneButton.setImage(UIImage(named: "saveIcon.png"), forState: .Normal)
        doneButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addScroll.addSubview(doneButton)
        // Do any additional setup after loading the view.
        
        self.placeField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        //self.imageView.enabled = false
        
            let userInfo = notification.userInfo! //キーボードの大きさを取得
            let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue() // 画面のサイズを取得
            let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        //　ViewControllerを基準にtextFieldの下辺までの距離を取得
            let txtLimit = placeField.frame.origin.y + placeField.frame.height + 8.0
        // ViewControllerの高さからキーボードの高さを引いた差分を取得
            let kbdLimit = myBoundSize.height - keyboardRect.size.height
        // こうすることで高さを確認できる（なくてもいい）
            print("テキストフィールドの下辺：(\(txtLimit))")
            print("キーボードの上辺：(\(kbdLimit))")
        //スクロールビューの移動距離設定
            if txtLimit >= kbdLimit {
                addScroll.contentOffset.y = txtLimit - kbdLimit
                
        }
    }

    func saveHistory(){
        if photoData == nil {
            let alert = UIAlertController(title: "No Photo", message: "写真を選択してください。",preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("No Photo")}
                )
            )
            presentViewController(alert, animated: true, completion: nil)
            
        }else{
        
        let nowDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_JP") // ロケールの設定
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let dictionary: [String: AnyObject] = ["place": placeField.text!, "comment": commentField.text!, "face": faceNumber, "image": photoData]
        userDefaults.setObject(dictionary, forKey:dateFormatter.stringFromDate(nowDate))
        userDefaults.synchronize()
        //print(dictionary)
        
        print("保存日時\(dateFormatter.stringFromDate(nowDate))")
        self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        // キーボードを閉じる
        self.view.endEditing(true)
        return false
    }
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        addScroll.contentOffset.y = 0
        //self.imageView.enabled = true
    }
    
    func faceSelector(){
        performSegueWithIdentifier("toFaceSelectViewSegue",sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let faceVC = segue.destinationViewController as! FaceSelectViewController
        
        //⑤デリゲートプロパティに通知を受け取る側のインスタンスを代入
        faceVC.delegate = self
    }
    
    //⑥デリゲートメソッドの実装
    func didTapFaceButton(faceNum: Int) {
        print(faceNum)
        faceNumber = faceNum
        print(faceName[faceNumber])
        faceButton = UIButton()
        faceButton.frame.size = CGSize(width: self.view.frame.width/4,height: self.view.frame.width/4)
        faceButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(58/100))
        faceButton.setImage(UIImage(named: faceName[faceNumber]), forState: .Normal)
        faceButton.addTarget(self, action: "faceSelector", forControlEvents: .TouchUpInside)
        addScroll.addSubview(faceButton)
    }
    
    func backToFirstView() {
        dismissViewControllerAnimated(true, completion: nil)
        //firstViewController.bgViewB.removeFromSuperview()
    }
    
    func photoSelectButtonTouchDown(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let imagePickerController = UIImagePickerController()
            // フォトライブラリから選択
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            // 編集ON
            imagePickerController.allowsEditing = true
            
            // デリゲート設定
            imagePickerController.delegate = self
            
            // 選択画面起動
            self.presentViewController(imagePickerController,animated:true ,completion:nil)
        }
    }
    
    // 写真選択時に呼ばれる
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // イメージ表示
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoView.image = image
        
        photoData = UIImageJPEGRepresentation(image!, 1)
        // 選択画面閉じる
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
}