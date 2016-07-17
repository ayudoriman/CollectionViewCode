//
//  ViewController.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/10/18.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var cView1:UICollectionView!
    var cView2:UICollectionView!
    var cView3:UICollectionView!
    var cView4:UICollectionView!
    var cView5:UICollectionView!
    
    var checkNum: Int!
    var date: String!
    var yearMonth: String!
    var monthCheck: Int!
    var bgViewB: UIView!
    var addButton: UIButton!
    var monthLabel: UILabel!
    
    var boxSizing = CGSizeZero
    
    let userdefaults = NSUserDefaults.standardUserDefaults()
    
    //test
    var colorArray = [  UIColor.grayColor(),
                        UIColor(red:88/255, green: 163/255, blue: 1, alpha: 1.0),
                        UIColor(red: 1, green: 88/255, blue: 131/255, alpha:1.0),
                        UIColor.redColor(),
                        UIColor.yellowColor(),
                        UIColor.greenColor(),
                        UIColor(red: 1, green: 161/255, blue: 26/255, alpha:1.0)]
    
    var backArray = [  UIColor(red:255/255, green: 48/255, blue: 92/255, alpha: 0.4),
                        UIColor(red:70/255, green: 114/255, blue: 255/255, alpha: 0.4),
                        UIColor(red:36/255, green: 255/255, blue: 31/255, alpha:0.4),
                        UIColor(red:255/255, green: 255/255, blue: 51/255, alpha: 0.4),
                        UIColor(red:255/255, green: 153/255, blue: 51/255, alpha: 0.4),
                        UIColor(red:199/255, green: 73/255, blue: 251/255, alpha: 0.4),
                        UIColor(red:0/255, green: 255/255, blue: 255/255, alpha: 0.4)]
    var backnumber = [0,1,2,3,4,5]
                    // gray/sad/happy/upset/

    var randomNumber1:[Int] = [0,1,2,3,4,5,6]
    var randomNumber2:[Int] = [0,1,2,3,4,5,6]
    var randomNumber3:[Int] = [0,1,2,3,4,5,6]
    var randomNumber4 = [0,1,2,3,4,5,6]
    var randomNumber5 = [0,1,2,3,4,5,6]
    
    var dates1 = ["1","2","3","4","5","6","7"]
    var dates2 = ["8","9","10","11","12","13","14"]
    var dates3 = ["15","16","17","18","19","20","21"]
    var dates4 = ["22","23","24","25","26","27","28"]
    var dates5 = ["29","30","31"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkNum = 0
        
        var sum: UInt32 = 7
        
        for _ in 1...7 {
            let random = (Int)(arc4random_uniform(sum))
            randomNumber1 += [random]
            sum = sum-1
            print(randomNumber1)
            print(sum)
        }
        //月の取得
        let nowDate = NSDate()
        let dateFormatter1 = NSDateFormatter()
            dateFormatter1.locale = NSLocale(localeIdentifier: "en_JP") // ロケールの設定
            dateFormatter1.dateFormat = "MM"
        let monthString = dateFormatter1.stringFromDate(nowDate)
        let dateFormatter2 = NSDateFormatter()
            dateFormatter2.locale = NSLocale(localeIdentifier: "en_JP")
            dateFormatter2.dateFormat = "yyyyMM"
        yearMonth = dateFormatter2.stringFromDate(nowDate)
        monthCheck = Int(monthString)!
        
        print("monthCheck:\(monthCheck)")
        print("現在の日時は\(nowDate)")
        
        //cell1つの大きさを計算
        boxSizing.height = self.view.frame.height/5
        boxSizing.width = self.view.frame.width
        
        // レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 1.5
        flowLayout.minimumLineSpacing = 1.5
        flowLayout.itemSize = CGSizeMake(boxSizing.height-1, boxSizing.height-1)
        
        // コレクションビュー1列目作成
        cView1 = UICollectionView(frame: CGRectMake(0, 0, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView1.registerClass(cView1Cell.self, forCellWithReuseIdentifier: "cView1Cell")
        cView1.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        cView1.tag = 1
        cView1.dataSource = self
        cView1.delegate = self
        view.addSubview(cView1)
        
         // コレクションビュー2列目作成
        cView2 = UICollectionView(frame: CGRectMake(0, boxSizing.height, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView2.registerClass(cView2Cell.self, forCellWithReuseIdentifier: "cView2Cell")
        cView2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        cView2.tag = 2
        cView2.dataSource = self
        cView2.delegate = self
        view.addSubview(cView2)
        
        // コレクションビュー3列目作成
        cView3 = UICollectionView(frame: CGRectMake(0, boxSizing.height*2, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView3.registerClass(cView3Cell.self, forCellWithReuseIdentifier: "cView3Cell")
        cView3.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        cView3.tag = 3
        cView3.dataSource = self
        cView3.delegate = self
        view.addSubview(cView3)
        
        // コレクションビュー4列目作成
        cView4 = UICollectionView(frame: CGRectMake(0, boxSizing.height*3, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView4.registerClass(cView4Cell.self, forCellWithReuseIdentifier: "cView4Cell")
        cView4.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        cView4.tag = 4
        cView4.dataSource = self
        cView4.delegate = self
        view.addSubview(cView4)
        
        //コレクションビュー5列目作成
        cView5 = UICollectionView(frame: CGRectMake(0, boxSizing.height*4, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView5.registerClass(cView5Cell.self, forCellWithReuseIdentifier: "cView5Cell")
        cView5.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        cView5.tag = 5
        cView5.dataSource = self
        cView5.delegate = self
        view.addSubview(cView5)
        
        addButton = UIButton()
        addButton.frame.size = CGSize(width: 80, height: 80)
        addButton.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*(3/4))
        addButton.setImage(UIImage(named: "screw.png"), forState: .Normal)
        addButton.addTarget(self, action: "addViewSegue", forControlEvents: .TouchUpInside)
        view.addSubview(addButton)
        
        monthLabel = UILabel()
        monthLabel.frame.size = CGSize(width: 40, height: 30)
        monthLabel.center = CGPoint(x: view.frame.width*(59.5/100), y: view.frame.height*(78.5/100))
        monthLabel.text = dateFormatter1.stringFromDate(nowDate)
        monthLabel.textColor = UIColor.whiteColor()
        view.addSubview(monthLabel)
        
        print("画面サイズ(横)\(self.view.frame.width)")
        print("画面サイズ(縦)\(self.view.frame.height)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let checkVisiting = userdefaults.objectForKey("tutorial")
        
        if checkVisiting == nil {
            userdefaults.setObject(true, forKey: "tutorial")
             performSegueWithIdentifier("toTurorialSegue", sender: self)
        }else{
           userdefaults.setObject(nil, forKey: "tutorial")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("=========================")
        print(collectionView.tag)
        
        if collectionView.tag == 1 {
            return 7
        }else {
            return 7
        }
        //if collectionView.tag == 5 {
        //return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let cell = cView1.dequeueReusableCellWithReuseIdentifier("cView1Cell", forIndexPath: indexPath) as! cView1Cell
            date = "\(yearMonth)0\(indexPath.item+1)"
            let dic = userdefaults.objectForKey(date)
            
            if dic == nil{
                let random = (Int)(arc4random_uniform(7))
                cell.backgroundColor = backArray[random]
            }else{
                let faceColor = dic?.valueForKey("face") as! Int
                cell.backgroundColor = colorArray[faceColor]
                cell.dateLabel1.textColor = UIColor.whiteColor()
                cell.shadow.image = UIImage(named: "shadow_square.png")
            }
            cell.dateLabel1.text = dates1[indexPath.row]
            return cell
            
        }else if collectionView.tag == 2{
            let cell = cView2.dequeueReusableCellWithReuseIdentifier("cView2Cell", forIndexPath: indexPath) as! cView2Cell
            
            if indexPath.item <= 1 {
                date = "\(yearMonth)0\(indexPath.item+8)"
            }else{
                date = "\(yearMonth)\(indexPath.item+8)"
            }
            
            let dic = userdefaults.objectForKey(date)
            if dic == nil{
                let random = (Int)(arc4random_uniform(7))
                cell.backgroundColor = backArray[random]
            }else{
                let faceColor = dic?.valueForKey("face") as! Int
                cell.backgroundColor = colorArray[faceColor]
                cell.dateLabel2.textColor = UIColor.whiteColor()
                cell.shadow.image = UIImage(named: "shadow_square.png")
            }
            cell.dateLabel2.text = dates2[indexPath.row]
            return cell
            
        }else if collectionView.tag == 3{
            let cell = cView3.dequeueReusableCellWithReuseIdentifier("cView3Cell", forIndexPath: indexPath) as! cView3Cell
            date = "\(yearMonth)\(indexPath.item+15)"
            let dic = userdefaults.objectForKey(date)
            
            if dic !== nil{
                let faceColor = dic?.valueForKey("face") as! Int
                cell.backgroundColor = colorArray[faceColor]
                cell.dateLabel3.textColor = UIColor.whiteColor()
                cell.shadow.image = UIImage(named: "shadow_square.png")
            }else{
                let random = (Int)(arc4random_uniform(7))
                cell.backgroundColor = backArray[random]

            }
//            if dic == nil{
//                let random = (Int)(arc4random_uniform(7))
//                cell.backgroundColor = backArray[random]
//            }else{
//                let faceColor = dic?.valueForKey("face") as! Int
//                cell.backgroundColor = colorArray[faceColor]
//                cell.dateLabel3.textColor = UIColor.whiteColor()
//                cell.shadow.image = UIImage(named: "shadow_square.png")
//            }
            cell.dateLabel3.text = dates3[indexPath.row]
            return cell
            
        }else if collectionView.tag == 4{
            let cell = cView4.dequeueReusableCellWithReuseIdentifier("cView4Cell", forIndexPath: indexPath) as! cView4Cell
            date = "\(yearMonth)\(indexPath.item+22)"
            let dic = userdefaults.objectForKey(date)
            
            if dic !== nil{
                print("exist")
                let faceColor = dic?.valueForKey("face") as! Int
                cell.backgroundColor = colorArray[faceColor]
                cell.dateLabel4.textColor = UIColor.whiteColor()
                cell.shadow.image = UIImage(named: "shadow_square.png")
            }else{
                let random = (Int)(arc4random_uniform(7))
                cell.backgroundColor = backArray[random]
            }

//            if dic == nil{
//                let random = (Int)(arc4random_uniform(7))
//                cell.backgroundColor = backArray[random]
//            }else{
//                print("exist")
//                let faceColor = dic?.valueForKey("face") as! Int
//                cell.backgroundColor = colorArray[faceColor]
//                cell.dateLabel4.textColor = UIColor.whiteColor()
//                cell.shadow.image = UIImage(named: "shadow_square.png")
//            }
            cell.dateLabel4.text = dates4[indexPath.row]
            return cell
        
            
        }else{
            if monthCheck == 2 {
                    let cell = cView5.dequeueReusableCellWithReuseIdentifier("cView5Cell", forIndexPath: indexPath) as! cView5Cell
                    
                    cell.backgroundColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
                    cell.userInteractionEnabled = false
                    return cell
                
           }else if monthCheck == 4 || monthCheck == 6 || monthCheck == 9 || monthCheck == 11 {
                if indexPath.row >= 2 {
                    let cell = cView5.dequeueReusableCellWithReuseIdentifier("cView5Cell", forIndexPath: indexPath) as! cView5Cell
                
                    cell.backgroundColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
                    cell.userInteractionEnabled = false
                    return cell
                
                } else {
                    let cell = cView5.dequeueReusableCellWithReuseIdentifier("cView5Cell", forIndexPath: indexPath) as! cView5Cell
                    date = "\(yearMonth)0\(indexPath.item+1)"
                    let dic = userdefaults.objectForKey(date)
                
                    if dic == nil{
                        let random = (Int)(arc4random_uniform(7))
                        cell.backgroundColor = backArray[random]
                    } else {
                        let faceColor = dic?.valueForKey("face") as! Int
                        cell.backgroundColor = colorArray[faceColor]
                        cell.dateLabel5.textColor = UIColor.whiteColor()
                        cell.shadow.image = UIImage(named: "shadow_square.png")
                    }
                
                    if indexPath.row < dates5.count {
                        cell.dateLabel5.text = dates5[indexPath.row]
                    }
                    return cell
                }
                
            } else {
                if indexPath.row >= 3 {
                    let cell = cView5.dequeueReusableCellWithReuseIdentifier("cView5Cell", forIndexPath: indexPath) as! cView5Cell
                    
                    cell.backgroundColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1)
                    cell.userInteractionEnabled = false
                    return cell
                    
                } else {
                    let cell = cView5.dequeueReusableCellWithReuseIdentifier("cView5Cell", forIndexPath: indexPath) as! cView5Cell
                    date = "\(yearMonth)0\(indexPath.item+1)"
                    let dic = userdefaults.objectForKey(date)
                    
                    if dic == nil{
                        let random = (Int)(arc4random_uniform(7))
                        cell.backgroundColor = backArray[random]
                    }else{
                        let faceColor = dic?.valueForKey("face") as! Int
                        cell.backgroundColor = colorArray[faceColor]
                        cell.dateLabel5.textColor = UIColor.whiteColor()
                        cell.shadow.image = UIImage(named: "shadow_square.png")

                    }
                    if indexPath.row < dates5.count {
                        cell.dateLabel5.text = dates5[indexPath.row]
                    }
                    return cell
                }
            }
        }
    }
    //
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if collectionView.tag == 1{
            date = "\(yearMonth)0\(indexPath.item+1)"
            let dic = userdefaults.objectForKey(date)
            //let comment: String? = dic?.valueForKey("comment") as? String
            let photo: NSData? = dic?.valueForKey("image") as? NSData
            
            if photo == nil{
                let alert = UIAlertController(title: "No Data", message: "思い出が見当たりません。",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("NoData")}
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
            }else{
                performSegueWithIdentifier("toSubViewController",sender: nil)
            }
            print("1-\(indexPath.item)")
        }
        if collectionView.tag == 2{
            if indexPath.item == 0{
                date = "\(yearMonth)08"
            }else if indexPath.item == 1{
                date = "\(yearMonth)09"
            }else{
                date = "\(yearMonth)\(indexPath.item+8)"
            }
            
            let dic = userdefaults.objectForKey(date)
            let photo: NSData? = dic?.valueForKey("image") as? NSData
            
            if photo == nil{
                let alert = UIAlertController(title: "No Data", message: "思い出が見当たりません。",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("NoData")}
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
            }else{
                performSegueWithIdentifier("toSubViewController",sender: nil)
            }
            print("3-\(indexPath.item)")
        }
        if collectionView.tag == 3{
            date = "\(yearMonth)\(indexPath.item+15)"
            let dic = userdefaults.objectForKey(date)
            let photo: NSData? = dic?.valueForKey("image") as? NSData
            
            if photo == nil{
                let alert = UIAlertController(title: "No Data", message: "思い出が見当たりません。",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("NoData")}
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
            }else{
                performSegueWithIdentifier("toSubViewController",sender: nil)
            }
            print("3-\(indexPath.item)")
        }
        if collectionView.tag == 4{
            date = "\(yearMonth)\(indexPath.item+22)"
            print(date)
            let dic = userdefaults.objectForKey(date)
            let photo: NSData? = dic?.valueForKey("image") as? NSData
            
            if photo == nil{
                let alert = UIAlertController(title: "No Data", message: "思い出が見当たりません。",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("NoData")}
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
            }else{
                performSegueWithIdentifier("toSubViewController",sender: nil)
            }
            print("4-\(indexPath.item)")
        }
        if collectionView.tag == 5{
            date = "\(yearMonth)\(indexPath.item+29)"
            let dic = userdefaults.objectForKey(date)
            let photo: NSData? = dic?.valueForKey("image") as? NSData
            
            if photo == nil{
                let alert = UIAlertController(title: "No Data", message: "思い出が見当たりません。",preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in print("NoData")}
                    )
                )
                presentViewController(alert, animated: true, completion: nil)
            }else{
                performSegueWithIdentifier("toSubViewController",sender: nil)
            }
                print("5-\(indexPath.item)")
        }
    }
    
    // 作成画面へのSegue 準備
    func addViewSegue(){
        print("Segue to AddViewController")
        checkNum = 1
        performSegueWithIdentifier("toAddViewController",sender: nil)
    }
    
    // 一覧画面へのSegue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSubViewController") {
            let sub: SubViewController = segue.destinationViewController as! SubViewController
            sub.sDate = date
        }
    }
}