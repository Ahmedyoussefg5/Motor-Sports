//
//  eventsVC.swift
//  Motor Sports
//
//  Created by Youssef on 10/3/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class EventsVC: UIViewController {

    @IBOutlet var eventsTableV: UITableView!
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = UIColor.yellow
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableConfiger()
        
    }

    public func tableConfiger() {
        
        eventsTableV.backgroundColor = UIColor.clear
        eventsTableV.isOpaque = false
        eventsTableV.backgroundView = nil
        
        eventsTableV.tableFooterView = UIView()
        eventsTableV.separatorInset = .zero
        eventsTableV.contentInset = .zero
        
        eventsTableV.addSubview(refresher)
        
        //eventsTableV(CellForRacer.self, forCellReuseIdentifier: "cellForRacer")
        eventsTableV.dataSource = self
        eventsTableV.delegate = self
    }
    
    @objc fileprivate func handleRefresh() {
        self.refresher.endRefreshing()
        
        //        API.tasks { (error: Error?, tasks: [Task]?, last_page: Int) in
        //            self.isLoading = false
        //            if let tasks = tasks {
        //                self.tasks = tasks
        //                self.tableView.reloadData()
        //
        //                self.current_page = 1
        //                self.last_page = last_page
        //            }
        //        }
        
    }

}
extension EventsVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventsTableV.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableV.dequeueReusableCell(withIdentifier: "eventsCell", for: indexPath) as! EventsCell
        
        
        //let task = tasks[indexPath.row]
        cell.ConfigureCell()            //(task: task)
        
        cell.backgroundColor = UIColor.clear
        cell.isOpaque = false
        cell.backgroundView = nil
        
        return cell
    }
}

extension EventsVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
