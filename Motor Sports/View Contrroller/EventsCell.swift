//
//  CellForNews.swift
//  Champione Arena
//
//  Created by Youssef on 9/1/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {
    

    @IBOutlet var order: UILabel!
    @IBOutlet var imageCountry: UIImageView!
    @IBOutlet var eventTitle: UILabel!
    @IBOutlet var first: UILabel!
    @IBOutlet var second: UILabel!
    @IBOutlet var third: UILabel!
    @IBOutlet var overAll: UILabel!
    
    
    
    func ConfigureCell()  {
        imageCountry.layer.cornerRadius = 25;
        
        imageCountry.layer.masksToBounds = true
    }
    

}
