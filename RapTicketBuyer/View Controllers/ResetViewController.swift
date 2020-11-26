//
//  ResetViewController.swift
//  Assignment1
//
//  Created by Herman Justino on 11/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var tickets : [tickets]?
    var selectedRow :Int = 0

    
    

    @IBOutlet weak var numberOfTickets: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
           
        return "\(tickets?[row].ticketType) Ticket: \(tickets?[row].ticketCount) Price: $\(tickets?[row].ticketPrice)"
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedRow = row
    }
    
   
    
    @IBOutlet weak var updatePicker: UIPickerView!
    
    
    @IBAction func save_pressed(_ sender: Any) {
        let numOfTickets = Int(numberOfTickets.text!)!
      //  tickets!.plusTicket(plus: numOfTickets, row: selectedRow)
        updatePicker.reloadAllComponents()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePicker.reloadAllComponents()
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
