
//  memberShip.swift
//  pakito
//
//  Created by macbook on 2/14/1397 AP.
//  Copyright © 1397 adAva. All rights reserved.
//

import UIKit

class memberShip {
    

    class func searchItem(type:String,search : String , success succeededs:@escaping ([SearchResult.Result]) -> (),failure failed:@escaping(String) -> ())  {
        let url = DataService.sharedInstance.search
        let params = ["q":search,"type":type]
        HTTPService.getMethod(Url: url, parametr: params, succeeded: { (data) in
            do {
                guard let data = data as? Data else{return}
                if type == SearchType.artist.rawValue {
                    let genres  = try JSONDecoder().decode(SearchResult.ArtistResult.self, from: data)
                    succeededs(genres.artists.items)
                }else{
                let genres  = try JSONDecoder().decode(SearchResult.TrackResult.self, from: data)
                
                succeededs(genres.tracks.items)
                }
            } catch {
                print(error)
            }
            
        }) { (error) in
             failed(error as? String ?? "")
        }

    }

    
    
}
