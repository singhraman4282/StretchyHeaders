//
//  TableViewCell.swift
//  stretchyHeaders
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var dets: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                title.text = item.category.toString()
                title.textColor = item.category.toColor()
                dets.text = item.summary
            } else {
                title.text = nil
                dets.text = nil
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
