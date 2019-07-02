//
//  DataService.swift
//  pakito
//
//  Created by macbook on 2/14/1397 AP.
//  Copyright © 1397 adAva. All rights reserved.
//

import UIKit

class DataService:NSObject {
    static let sharedInstance = DataService()
    private var _base_URL = ""
    private var _search  = ""



    override init() {
        _base_URL                   = "https://api.spotify.com/v1/"
        _search                     = _base_URL + "search"

    }
    var search:String{
        return _search
    }
//    var addComment:String{
//        return _addComment
//    }
}
