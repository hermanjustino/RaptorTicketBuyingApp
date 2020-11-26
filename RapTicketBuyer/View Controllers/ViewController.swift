//
//  ViewController.swift
//  Assignment1
//
//  Created by Herman Justino on 11/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var ticketsArrayList : ticketsArray?
    var historyArray : historyModel?
    var ticket = [tickets]()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ticket.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        return "\(ticket[row].ticketType) Ticket: \(ticket[row].ticketCount) Price: $\(ticket[row].ticketPrice)"
    }
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var numOfTicketsLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var numOfTicket : Int = 0
    var numOfTicketString : String = ""
    var selectedRow : Int = 0
    var totalPrice : Double = 0
    var titleSelectedRow : String = ""
    
        
    @IBAction func digit_Pressed(_ sender: Any) {
        numOfTicketString += "\((sender as! UIButton).currentTitle ?? "")"
        numOfTicketsLabel.text! = "Number of tickets: \(numOfTicketString)";
        numOfTicket = Int(numOfTicketString) ?? 0
        countTotalPrice()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedRow = row
        titleSelectedRow = ticket[row].ticketType
        typeLabel.text = "Type: \(titleSelectedRow)"
        countTotalPrice()
    }
    
    func countTotalPrice(){
        totalPrice = Double(numOfTicket) * (ticket[selectedRow].ticketPrice ?? 0)
        totalPriceLabel.text = "Total Price: $\(totalPrice)"
    }
    
    
    func dateNow() -> String {
        var thisDate : String = ""
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        thisDate = String(formatter.string(from: currentDate))
        return thisDate
    }
    
    @IBAction func buy_Pressed(_ sender: Any) {
        if (ticket[selectedRow].ticketCount) >= numOfTicket{
            ticketsArrayList?.minusTicket(minus: numOfTicket, row: selectedRow)
            let myDate = dateNow()
            let newHistory = history(type: titleSelectedRow,
                                     count: String(numOfTicket),
                                     total: String(totalPrice),
                                     date: myDate)
            historyArray?.historyModel.append(newHistory)
        }else{
            let alert = UIAlertController(title: ticket[selectedRow].ticketType, message: "We do not have enough tickets for you, only \(ticket[selectedRow].ticketCount) left", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        pickerView.reloadAllComponents()
    }
    
    @IBAction func clear_Pressed(_ sender: Any) {

        numOfTicket = 0
        numOfTicketsLabel.text = "Number of tickets: "
        numOfTicketString = ""
        
        totalPrice = 0
        totalPriceLabel.text = "Total Price: "
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI(){
        ticketsArrayList!.fetchJSONData{(package) in
            DispatchQueue.main.async {
                self.ticket = package.data
                self.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let managerVC = segue.destination as! ManagerViewController
        managerVC.ticket = ticket
        managerVC.history = historyArray
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickerView.reloadAllComponents()
    }
    


}

