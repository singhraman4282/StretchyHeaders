//
//  NewsItem.swift
//  stretchyHeaders
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

struct NewsItem {

    enum NewsCategory {
        case World
        case Americas
        case Europe
        
        func toString()->String {
            switch self {
            case .World:
                return "World"
            case .Americas:
                return "Americas"
            case .Europe:
                return "Europe"
            }
        }
        
        func toColor()->UIColor {
            switch self {
            case .World:
                return UIColor.red
            case .Americas:
                return UIColor.green
            case .Europe:
                return UIColor.brown
            }
        }
        
    }//enum
    
    let category: NewsCategory
    let summary:String
    
}
