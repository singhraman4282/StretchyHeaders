//
//  ViewController.swift
//  stretchyHeaders
//
//  Created by Raman Singh on 2018-05-22.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let items = [NewsItem(category: .World, summary: "In response to the dramatic growth of the newest mutual fund category, the Funds of Funds Association, a nonprofit organization, has been formed to provide accessible statistical data and educational material for the investing public and the media."), NewsItem(category: .Europe, summary: "Funds of Funds are a group of mutual funds that are actively managed portfolios, including a wide variety of investment objectives and investment vehicles"), NewsItem(category: .Americas, summary: "There has been a dramatic, fivefold increase in the number of Funds of Funds for two reasons -- the increasing complexity of the mutual fund world and investors' lack of time. The confusion and time pressure inevitably lead to an offloading of responsibility for investment management to a third party,"), NewsItem(category: .World, summary: "The Sample News Group, LLC, was founded by George Raymond Sample, Jr. (1924–2008).[1] As of 2017, George \"Scoop\" Sample (né George Raymond Sample III; born 1952), one of eight children of George Sample, is listed as President. The Biddle family – namely two sons of Joseph Franklin Biddle, publishers John Hunter Biddle (1905–1977) and successor Joseph Franklin Biddle II (born 1936) – former publisher The Daily News of Huntingdon, Pennsylvania, sold The Joseph F. Biddle Publishing Company to The Sample News Group on October 21, 1991. The Sample News Group is also actively managed by George Sample's wife, Marlene Sample (aka \"Sissie\" Kane; née Marlene Sue Kane; born 1951).")]
    
    let kTableHeaderHeight:CGFloat = 300.0
    var headerView:UIView!
    private let ktableHeaderCutaway:CGFloat = 80.0
    var headerMaskLayer:CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
//        tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0)
//        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        let effectiveHeight = kTableHeaderHeight-ktableHeaderCutaway/2
        tableView.contentInset = UIEdgeInsetsMake(effectiveHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = headerMaskLayer
        updateHeaderView()
        
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let item = items[indexPath.row]
        cell.newsItem = item
        return cell
    }
    
    func updateHeaderView() {
        let effectiveHeight = kTableHeaderHeight-ktableHeaderCutaway/2
//        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: self.view.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -effectiveHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + ktableHeaderCutaway/2
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height - ktableHeaderCutaway))
        headerMaskLayer?.path = path.cgPath
        
        headerView.frame = headerRect
        
        
        
        
        
    }//updateHeaderView
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    

}

