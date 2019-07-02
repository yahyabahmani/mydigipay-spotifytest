//
//  ViewController.swift
//  spotifyTest
//
//  Created by macbook on 4/10/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import UIKit
import SpotifyLogin
import Alamofire
class ViewController: UIViewController {
    var loginButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = SpotifyLoginButton(viewController: self,
                                        scopes: [.streaming,
                                                 .userReadTop,
                                                 .playlistReadPrivate,
                                                 .userLibraryRead])
        self.view.addSubview(button)
        self.loginButton = button
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginSuccessful),
                                               name: .SpotifyLoginSuccessful,
                                               object: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton?.center = self.view.center
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func loginSuccessful() {
     
//        let url = "https://api.spotify.com/v1/search?q=good&type=track"
//        Alamofire.request(url).responseJSON { (response) in
//            if !response.result.isSuccess {
//                if response.result.error != nil {
//                    print(response.result.error.debugDescription )
////                    failed(error.localizedDescription)
//                }
//            }
//            guard let value = response.result.value else {return}
//            if let json = value as? NSDictionary {
//                print("ggh")
////                guard let message = json["messages"] as? JSONArray else{return}
////                let messageModel = MessageModel.parseMessage(jsonArray: message)
////                succeededs(messageModel)
//            }
//
//        }
//
////        self.navigationController?.popViewController(animated: true)
//    }
}
}
