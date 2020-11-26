//
//  tickets.swift
//  Assignment1
//
//  Created by Herman Justino on 10/15/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import Foundation

class tickets: Codable{
    
    var ticketType: String
    var ticketCount: Int
    var ticketPrice : Double
}
    class ticketsPackage: Codable {
        var headline: String
        var version: String
        var count: Int
        var data: [tickets]
    }
