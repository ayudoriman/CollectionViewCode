//
//  cView1Cell.swift
//  CollectionViewCode
//
//  Created by KFCC on 2015/10/18.
//  Copyright © 2015年 KFCC. All rights reserved.
//

import UIKit

class cView1Cell: UICollectionViewCell {
    var dateLabel1: UILabel!
    var shadow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dateLabel1 = UILabel()
        dateLabel1.frame = CGRectMake(14, 14, self.frame.width*(1/3), self.frame.height*(1/4))
        dateLabel1.textColor = UIColor.whiteColor()
        dateLabel1.font = UIFont.systemFontOfSize(self.frame.height*(1/4))
        
        shadow = UIImageView()
        shadow.frame = CGRectMake(0, 0, self.frame.width, self.frame.height)
        shadow.image = UIImage(named: "shadow_square.png")
        
        self.addSubview(shadow)
        self.addSubview(dateLabel1)
    }
        // UILabelとかを追加

}
