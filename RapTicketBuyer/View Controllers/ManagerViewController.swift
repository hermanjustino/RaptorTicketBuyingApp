//
//  ManagerViewController.swift
//  Assignment1
//
//  Created by Herman Justino on 11/22/20.
//  Copyright © 2020 user182432. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {

    var ticket : [tickets]?
    var history :historyModel?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "update"{
            let resetVC = segue.destination as! ResetViewController
            resetVC.tickets = ticket
        }else if segue.identifier == "history"{
            let historyVC = segue.destination as! HistoryViewController
            historyVC.history = history
        }
        
    }
    
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
