//
//  HTTPService.swift
//  pakito
//
//  Created by macbook on 2/14/1397 AP.
//  Copyright © 1397 adAva. All rights reserved.
//

import UIKit
import Alamofire
import SpotifyLogin
class HTTPService {
    class func postMethodBody (parametr:Dictionary<String, Any>,andUrl url:String,headers:[String:String]?,succeeded: @escaping ((_ resultValue:Any,_ resultData:Any)->()),failure failed: @escaping ((Any,Int?)->())) {
        var headers :[String:String]?
        if let  uuid = UIDevice.current.identifierForVendor {
            headers = ["user-id":"5141","user-email":"yahya.bahmani16@gmail.com","user-device-id":uuid.uuidString,"user-token":"9b3ddf278a5ae40d843f12076fdf63b4dfbafd98399a7f71fadcd059bf503f62"]
        }
        //        let headers: HTTPHeaders = ["Accept": "application/json"]
        print("ib-log***\(url)^^^^^\(parametr)")
        
        Alamofire.request(url, method: .post, parameters: parametr, encoding: URLEncoding.httpBody , headers: headers).validate().responseJSON { response in
            
            guard response.result.isSuccess else{
                
                failed(response.data as Any,response.response?.statusCode)
                return
            }
            
            guard let value = response.result.value ,let data =  response.data else {return}
            succeeded(value,data)
        }
    }
    
    class func postMethod(parametr:Dictionary<String, Any>,andUrl url:String,succeeded: @escaping ((Any)->()),failure failed: @escaping ((Any)->())) {
        let headers: HTTPHeaders = ["X-Requested-With": "XMLHttpRequest"]
        print("ib-log***\(url)^^^^^\(parametr)")

        Alamofire.request(url, method: .post, parameters: parametr, headers: headers).validate(statusCode: 200...320).responseJSON { response in
            if !response.result.isSuccess {
                if let error = response.result.error {
                    failed(error.localizedDescription)
                }
            }
            
            guard let value = response.result.value else {return}
            succeeded(value)
            
        }
        
        
    }

    class func getMethod (Url url:String,parametr:[String:String]? = nil,succeeded: @escaping ((Any)->()),failure failed: @escaping ((Any)->())) {
        print("ib-log***\(url)")
        print("in-params^^\(parametr)")
        SpotifyLogin.shared.getAccessToken { (token, error) in
            if error == nil, token != nil {
                
                let header = ["Authorization":("Bearer " + token! )]
                Alamofire.request(url, method: .get, parameters: parametr,headers: header).responseJSON { (response) in
                    if !response.result.isSuccess {
                        if let error = response.result.error {
                            failed(error.localizedDescription)
                        }
                    }
                    guard let value = response.data else {return}
                    
                    succeeded(value)
                }
                
                
                
                
            }
        }
       
    
}
    
    
    
}
