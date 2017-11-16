//
//  GenderClient.swift
//  GenderGuesser-ios
//
//  Created by Darius Vilcinskis on 12/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import Foundation

class GenderClient {
    func getGender (name: String, response: (GenderModel) -> Void) {
        let url = URL(string: "https://api.genderize.io/?name=\(name)")
        
        do {
            let jsonData = try Data(contentsOf: url!)
        
            let jsonDecoder = JSONDecoder()
            let users = try? jsonDecoder.decode(GenderModel.self, from: jsonData)
            
            guard let responseModel = users as GenderModel? else {
                raiseUnknownGender(response: response)
                return
            }
            
            response(responseModel)
        } catch {
            raiseUnknownGender(response: response)
        }
    }
    
    func raiseUnknownGender(response: (GenderModel) -> Void) {
        response(GenderModel(name: "", gender: "unknown", probability: 0, count: 0))
    }
}
