//
//  cView3Cell.swift
//  CollectionViewCode
//
//  Created by S.ONO on 2016/02/08.
//  Copyright © 2016年 KFCC. All rights reserved.
//

import UIKit

class cView3Cell: UICollectionViewCell {
    var dateLabel3: UILabel!
    var shadow: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel3 = UILabel()
        dateLabel3.frame = CGRectMake(12, 12, self.frame.width*(1/3), self.frame.height*(1/4))
        dateLabel3.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.4)
        dateLabel3.font = UIFont.systemFontOfSize(self.frame.height*(1/4))
        
        shadow = UIImageView()
        shadow.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        shadow.image = UIImage(named: "shadow_square.png")
        
        self.addSubview(shadow)
        self.addSubview(dateLabel3)
    }

}
