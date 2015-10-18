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
    var boxSizing = CGSizeZero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        cView1.registerNib(UINib(nibName: "cView1Cell", bundle: nil), forCellWithReuseIdentifier: "cView1Cell")
        cView1.dataSource = self
        view.addSubview(cView1)
         // コレクションビュー2列目作成
        cView2 = UICollectionView(frame: CGRectMake(0, boxSizing.height, boxSizing.width, boxSizing.height), collectionViewLayout: flowLayout)
        cView2.registerNib(UINib(nibName: "cView2Cell", bundle: nil), forCellWithReuseIdentifier: "cView2Cell")
        cView2.dataSource = self
        view.addSubview(cView2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCellWithReuseIdentifier("cell1", forIndexPath: indexPath) as! cView1Cell
        cell1.backgroundColor = UIColor.redColor()
        return cell1
    
//        let cell2 = collectionView.dequeueReusableCellWithReuseIdentifier("cell2", forIndexPath: indexPath) as! cView2Cell
//        cell2.backgroundColor = UIColor.blueColor()
//        return cell2
    }
}

