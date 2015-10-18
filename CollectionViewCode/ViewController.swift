//
//  ViewController.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/10/18.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    var cView1:UICollectionView!
    var cView2:UICollectionView!
    var cView3:UICollectionView!
    var cView4:UICollectionView!
    
    var boxSizing = CGSizeZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //cell1つの大きさを計算
        boxSizing.height = self.view.frame.height/4
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
        cView1.dataSource = self
        
         // コレクションビュー2列目作成
        cView2 = UICollectionView(frame: CGRectMake(0, boxSizing.height, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView2.registerClass(cView2Cell.self, forCellWithReuseIdentifier: "cView2Cell")
        cView2.dataSource = self
        
        // コレクションビュー3列目作成
        cView3 = UICollectionView(frame: CGRectMake(0, boxSizing.height*2, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView3.registerClass(cView3Cell.self, forCellWithReuseIdentifier: "cView3Cell")
        cView3.dataSource = self
        
        // コレクションビュー4列目作成
        cView4 = UICollectionView(frame: CGRectMake(0, boxSizing.height*3, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView4.registerClass(cView4Cell.self, forCellWithReuseIdentifier: "cView4Cell")
        cView4.dataSource = self
        
        view.addSubview(cView1)
        view.addSubview(cView2)
        view.addSubview(cView3)
        view.addSubview(cView4)
        print(cView2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addview() {
        print("hoge")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell1 = cView1.dequeueReusableCellWithReuseIdentifier("cView1Cell", forIndexPath: indexPath) as! cView1Cell
        cell1.backgroundColor = UIColor.blueColor()

        let cell2 = cView2.dequeueReusableCellWithReuseIdentifier("cView2Cell", forIndexPath: indexPath) as! cView2Cell
        cell2.backgroundColor = UIColor.blueColor()
        
        return cell1
    }
}

