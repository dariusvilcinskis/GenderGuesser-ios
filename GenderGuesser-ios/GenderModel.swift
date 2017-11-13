//
//  GenderModel.swift
//  GenderGuesser-ios
//
//  Created by Darius Vilcinskis on 12/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import Foundation
struct GenderModel : Codable {
    let name : String?
    let gender : String?
    let probability : Double?
    let count : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case gender = "gender"
        case probability = "probability"
        case count = "count"
    }
    
    init(name: String, gender: String, probability: Double, count: Int)
    {
        self.name = name
        self.gender = gender
        self.probability = probability
        self.count = count
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        probability = try values.decodeIfPresent(Double.self, forKey: .probability)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
    
}
