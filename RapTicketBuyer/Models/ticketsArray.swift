//
//  ticketsArray.swift
//  Assignment1
//
//  Created by Herman Justino on 11/22/20.
//  Copyright © 2020 Herman Justino. All rights reserved.
//

import Foundation

class ticketsArray{
    
    
    func fetchJSONData( competionHandler : @escaping (ticketsPackage)->Void){
        let url = URL(string: "https://raw.githubusercontent.com/hermanjustino/ITE5334_iOS/main/raptorsTickets.json")!
        
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            
            if let error = error{
                print(error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
                else{
                    if let httpRespone = response as? HTTPURLResponse{
                        print ("URL: \(httpRespone.url!.path) \nStatus code: \(httpRespone.statusCode)")
                    }
                    return
            }
            
            if let mimeType = httpResponse.mimeType,
                mimeType.starts(with: "text/plain"),
                let data = data{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                do{
                    let result = try decoder.decode(ticketsPackage.self, from: data)
                    print(result.version)
                    competionHandler(result)
                }
                catch{
                    print(error)
                }
            }
            
            
        }
        task.resume()
    }
    
    
    
    
    
    func minusTicket(minus: Int, row:Int) {
    }
    
    func plusTicket(plus: Int, row: Int){
    }
}
