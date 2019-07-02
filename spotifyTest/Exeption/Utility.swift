//
//  Utility.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import Foundation
import UIKit
enum SearchType:String {
    case artist  = "artist"
    case track = "track"
}
class Alerts:NSObject{
    
    class func ShowAlert(title:String = "",message : String?,vc:UIViewController) {
        var messageFinal = ""
        if let  messeageTemp =  message {
            if messeageTemp.count == 0 {
                messageFinal =  "مشکل در ارتباط با سرور"
            }else {
                messageFinal = message ?? "مشکل در ارتباط با سرور"
            }
        }else{
            messageFinal =  "مشکل در ارتباط با سرور"
            
        }
        
        let alert = UIAlertController(title: title, message: messageFinal , preferredStyle: .alert)
        
        let okAction = UIAlertAction(title:"بسیارخب", style: UIAlertAction.Style.default,handler: { (action: UIAlertAction!) in
        })
        
        
        alert.addAction(okAction)
        OperationQueue.main.addOperation {
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
