//
//  Resort.swift
//  uitask
//
//  Created by Анастасія Локайчук on 18.06.2022.
//

import Foundation
struct  Resort: Codable,Identifiable
{
    let id: String
    let name: String
    let country: String
    let description:String
    let imageCredit : String
    let price: Int
    let size: Int
    let snowDepth :Int
    let elevation : Int
    let runs: Int
    let facilities : [String]
    
    
    static let allResort : [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResort[0]
    
}
