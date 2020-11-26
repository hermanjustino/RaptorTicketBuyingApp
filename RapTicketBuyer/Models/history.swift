//
//  history.swift
//  Assignment1
//
//  Created by Herman Justino on 10/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import Foundation


class history{
   var typeHistory : String
    var countHistory: String
    var totalHistory: String
    var dateHistory : String
    
    init(type: String, count: String, total: String, date: String) {
        typeHistory = type
        countHistory = count
        totalHistory = total
        dateHistory = date
    }
}
