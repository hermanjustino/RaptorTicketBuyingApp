//
//  HistoryViewController.swift
//  Assignment 5

//  Created by Herman Justino on 11/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history : historyModel?
    var rowNumber: Int?

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (history?.historyModel.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history")
        cell?.textLabel?.text = history?.historyModel[indexPath.row].typeHistory
        cell?.detailTextLabel?.text = history?.historyModel[indexPath.row].countHistory
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @IBOutlet weak var tableHistory: UITableView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        rowNumber = tableHistory.indexPathForSelectedRow?.row
        let detailsVS = segue.destination as! DetailsViewController
        detailsVS.history = history
        detailsVS.rowNumber = rowNumber
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
