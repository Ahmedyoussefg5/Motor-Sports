//
//  ViewController.swift
//  Motor Sports
//
//  Created by Youssef on 10/3/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var currentSelectedButton: Int = 0
    let buttonsImagesUnselected: [String] = ["non", "racer", "team", "news", "events", "settings", "live", "fac", "notif"]
    
    lazy var refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = UIColor.yellow
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        return refresher
    }()
    
    @IBOutlet var nav: UINavigationItem!
    @IBOutlet var mainView: UIView!
    @IBOutlet var tableMain: UITableView!
    @IBOutlet var topButtons: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PicinTitle()
        
        unSelectOther()
        
        tableConfiger()
        
        handleRefresh()
    }
    
    @IBAction func topButtonPressed(_ sender: Any) {
        let senderTag = (sender as AnyObject).tag
        switch senderTag {
        case 1:
            if currentSelectedButton != 1 {
                unSelectOther()
                currentSelectedButton = 1
                (sender as AnyObject).setBackgroundImage(UIImage(named: "racerse"), for: .normal);
                getMainTable()
            }
            return
        case 2:
            if currentSelectedButton != 2 {
                unSelectOther()
                currentSelectedButton = 2
                (sender as AnyObject).setBackgroundImage(UIImage(named: "teamse"), for: .normal);
                getMainTable()
            }
            return
        case 3:
            if currentSelectedButton != 3 {
                unSelectOther()
                currentSelectedButton = 3
                (sender as AnyObject).setBackgroundImage(UIImage(named: "newsse"), for: .normal)
                getMainTable()
            }
            return
        case 4:
            if currentSelectedButton != 4 {
                unSelectOther()
                currentSelectedButton = 4
                (sender as AnyObject).setBackgroundImage(UIImage(named: "eventsse"), for: .normal)
                toRacerDetails()
            }
            return
        default:
            return
        }
    }
    
    func unSelectOther() {
        print(currentSelectedButton)
        let tmpButton = self.view.viewWithTag(currentSelectedButton) as? UIButton
        tmpButton?.setBackgroundImage(UIImage(named: buttonsImagesUnselected[currentSelectedButton]), for: .normal)
    }
    
    
    func tableConfiger() {
        
        tableMain.backgroundColor = UIColor.clear
        tableMain.isOpaque = false
        tableMain.backgroundView = nil
        
        tableMain.tableFooterView = UIView()
        tableMain.separatorInset = .zero
        tableMain.contentInset = .zero
        
        tableMain.addSubview(refresher)
        
        //tableMain.register(CellForRacer.self, forCellReuseIdentifier: "cellForRacer")
        tableMain.dataSource = self
        tableMain.delegate = self
    }
    
    var isLoading: Bool = false
    var current_page = 1
    var last_page = 1
    @objc fileprivate func handleRefresh() {
        self.refresher.endRefreshing()
        guard !isLoading else { return }
        
        isLoading = true
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
    
    fileprivate func loadMore() {
        guard !isLoading else { return }
        guard current_page < last_page else { return }
        
        isLoading = true
        //        API.tasks(page: current_page+1) { (error: Error?, tasks: [Task]?, last_page: Int) in
        //            self.isLoading = false
        //            if let tasks = tasks {
        //                self.tasks.append(contentsOf: tasks)
        //                self.tableView.reloadData()
        //
        //                self.current_page += 1
        //                self.last_page = last_page
        //            }
        //        }
    }
    
    func toRacerDetails()
    {
        let racerDetails: UIViewController
        
        switch currentSelectedButton {
        case 1:
            racerDetails = storyboard!.instantiateViewController(withIdentifier: "racerDetailsVC") as! RacerDetailsVC
        case 2:
            racerDetails = storyboard!.instantiateViewController(withIdentifier: "teamVC") as! TeamVC
        case 3:
        racerDetails = storyboard!.instantiateViewController(withIdentifier: "newsDetails") //as! TeamVC
        case 4:
            racerDetails = storyboard!.instantiateViewController(withIdentifier: "eventsVC") as! EventsVC
        default:
            return
        }
        
        addChildViewController(racerDetails)
        self.mainView.addSubview(racerDetails.view)
        racerDetails.view.frame = mainView.bounds
        racerDetails.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        racerDetails.didMove(toParentViewController: self)
        
        //currentSelectedButton = 0
    }
    
    func getMainTable()
    {
        if self.childViewControllers.count > 0 {
            let viewControllers:[UIViewController] = self.childViewControllers
            for viewContoller in viewControllers{
                viewContoller.willMove(toParentViewController: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParentViewController()
            }
        }
        handleRefresh()
    }
}


extension MainVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        toRacerDetails()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableMain.dequeueReusableCell(withIdentifier: "cellForRacer", for: indexPath) //as? CellForRacer
        
        
        //let task = tasks[indexPath.row]
        //cell.ConfigureCell()            //(task: task)
        
        cell.backgroundColor = UIColor.clear
        cell.isOpaque = false
        cell.backgroundView = nil
        
        return cell
    }
}

extension MainVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //let count = self.tasks.count
        
        //        if indexPath.row == count-1 {
        //            // last row
        //            self.loadMore()
        //        }
    }
    
}

