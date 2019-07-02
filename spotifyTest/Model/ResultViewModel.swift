//
//  ResultViewModel.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import Foundation
class ResultViewModel {
    var result = [SearchResult.Result]()
    
    func searchResult(_ type:String, _ text:String,failure failed:@escaping(String?) -> ()) {
        memberShip.searchItem(type:type,search: text, success: { (data) in
            self.result = data
            failed(nil)
        }) { (error) in
            failed(error)
        }
        
    }
    
    
    
}
