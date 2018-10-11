//
//  File.swift
//  PoolMeUp
//
//  Created by Youssef on 8/8/18.
//  Copyright © 2018 Youssef. All rights reserved.
//
import UIKit
import Foundation

class Helper: NSObject{
    
    class func restartApp() {
        guard let window =  UIApplication.shared.keyWindow else { return }

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController(withIdentifier: "mainVC") as! MainVC
        //homeVC.currentSelectedButton = 2
        let navigationController = UINavigationController(rootViewController: homeVC)
        //self.present(navigationController, animated: true, completion: nil)

        window.rootViewController = navigationController
        UIView.transition(with: window, duration: 1.0, options: .curveEaseOut, animations: nil, completion: nil)
    }
    
    class func restartAppHome() {
        guard let window =  UIApplication.shared.keyWindow else { return }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc :UIViewController
        //if getAPIToken() == nil {
        // Skip Auth Screen
        //vc = sb.instantiateInitialViewController()!
        // }
        //else {
        vc = sb.instantiateViewController(withIdentifier: "themainVC")
        // }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 1.0, options: .transitionCurlUp, animations: nil, completion: nil)
    }
    
    class func getAPIToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "api_token") as? String
    }
    
    class func saveIPItoken(apistring: String) {
        let def = UserDefaults.standard
        def.setValue(apistring, forKey: "api_token")
        def.synchronize();
        
        //restartApp();
    }
    

    
    class func saveUserData(key: String, value: String) {
        let def = UserDefaults.standard
        def.setValue(value, forKey: key)
        def.synchronize();
    }
    
    class func signOut(){
        UserDefaults.standard.removeObject(forKey: "api_token")
        restartAppHome()
    }
    
    // MARK: - USER MAIL CHECK
    class func isValidEmail(usermail:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: usermail)
    }
    
    class func getDatecomponents (date: Date) -> String
    {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
            let myString = formatter.string(from: date)
            let Date = formatter.date(from: myString)
            formatter.dateFormat = "yyyy-MM-dd"
            //formatter.dateFormat = "dd-MMM-yyyy"
            let myStringafd = formatter.string(from: Date!)
            print("pik date is ", myStringafd)
        return myStringafd
        
    }
}









