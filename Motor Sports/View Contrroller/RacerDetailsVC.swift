//
//  RacerDetailsVC.swift
//  Motor Sports
//
//  Created by Youssef on 10/3/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class RacerDetailsVC: UIViewController {

    

    
    @IBOutlet var carousel: iCarousel!
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var ageLable: UILabel!
    @IBOutlet var hightLable: UILabel!
    @IBOutlet var whightLable: UILabel!
    
    
    var items: [Int] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in 0 ... 30 {
            items.append(i)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.delegate = self;
        carousel.dataSource = self;
        
        carousel.type = .coverFlow2
    }
    
}
extension RacerDetailsVC: iCarouselDataSource, iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var itemView: UIImageView
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
            //get a reference to the label in the recycled view
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            let height = carousel.frame.height;
            let width = carousel.frame.width;
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: width / 2, height: height / 2))
            itemView.image = UIImage(named: "playerIMG")
            itemView.contentMode = .scaleAspectFit
        }
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
        
    }
}
