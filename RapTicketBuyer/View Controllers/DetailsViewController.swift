//
//  DetailsViewController.swift
//  Assignment1
//
//  Created by Herman Justino on 10/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    var history : historyModel?
    var rowNumber : Int?
    
    
    
    @IBAction func close_Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemLabel.text = history?.historyModel[rowNumber!].typeHistory
        quantityLabel.text = history?.historyModel[rowNumber!].countHistory
        totalLabel.text = history?.historyModel[rowNumber!].totalHistory
        dateLabel.text = history?.historyModel[rowNumber!].dateHistory

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
