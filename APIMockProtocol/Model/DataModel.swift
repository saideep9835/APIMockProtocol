//
//  DataModel.swift
//  APIMockProtocol
//
//  Created by Saideep Reddy Talusani on 9/19/24.
//

import Foundation


struct DataModel: Codable{
    let id: String
    let type: String
    let name: String
    let ppu: Double
    let batters: Batters
    let topping: [Topping]
}
struct Batters: Codable{
    let batter: [Topping]
}
struct Topping: Codable{
    let id: String
    let type: String
}
