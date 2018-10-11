//
//  TeamVC.swift
//  Motor Sports
//
//  Created by Youssef on 10/3/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class TeamVC: UIViewController {
    @IBOutlet var teamImage: UIImageView!
    
    @IBOutlet var teamName: UILabel!
    @IBOutlet var contentTXT: UITextView!
    @IBOutlet var teamCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}
extension TeamVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 150
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "teamImageCell", for: indexPath)
        
        return cell
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    
    
}

class teamDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cellImage: UIImageView!
    
    func configerCell() {
        
    }
    
}
