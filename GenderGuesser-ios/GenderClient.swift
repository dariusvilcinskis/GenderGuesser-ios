//
//  GenderClient.swift
//  GenderGuesser-ios
//
//  Created by Darius Vilcinskis on 12/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import Foundation

class GenderClient {
    func getGender (name: String, respon: (GenderModel) -> String) {
        let url = URL(string: "https://api.genderize.io/?name=\(name)")
        do {
            let jsonData = try Data(contentsOf: url!)
        
        
            let jsonDecoder = JSONDecoder()
            let users = try? jsonDecoder.decode(GenderModel.self, from: jsonData)
            respon(users as! GenderModel)
        } catch {
            respon(GenderModel(name: "", gender: "unknown", probability: 0, count: 0))
        }
    }
}
