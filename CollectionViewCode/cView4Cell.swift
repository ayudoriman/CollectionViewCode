//
//  cView4Cell.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/10/18.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

class cView4Cell: UICollectionViewCell {
    var dateLabel4: UILabel!
    var shadow: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel4 = UILabel()
        dateLabel4.frame = CGRectMake(12, 12, self.frame.width*(1/3), self.frame.height*(1/4))
        dateLabel4.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4)
        dateLabel4.font = UIFont.systemFontOfSize(self.frame.height*(1/4))
        
        shadow = UIImageView()
        shadow.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        //shadow.image = UIImage(named: "shadow_square.png")
        
        self.addSubview(shadow)
        self.addSubview(dateLabel4)
    }
}
