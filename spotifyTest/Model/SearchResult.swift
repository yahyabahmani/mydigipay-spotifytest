//
//  SearchResult.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import Foundation
class SearchResult {
    struct TrackResult:Decodable {
        var tracks = ItemResult()
    }
    struct  ArtistResult :Decodable{
        var artists = ItemResult()
    }

    struct Alubum:Decodable {
          var images : [SearchImage]?
    }
    struct  ItemResult:Decodable {
        var items = [Result]()
    }
    struct Result:Decodable {
        var album : Alubum?
        var id:String?
        var name:String?
        var images : [SearchImage]?
        var href:String?
        var type:String?
    }
}

struct SearchImage:Decodable {
    var url :String?
    
}


