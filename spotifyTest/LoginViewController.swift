//
//  LoginViewController.swift
//  spotifyTest
//
//  Created by macbook on 4/11/1398 AP.
//  Copyright © 1398 Yahya. All rights reserved.
//

import UIKit
import SpotifyLogin
class LoginViewController: UIViewController {

    var loginButton: UIButton?
    
    fileprivate func prepareSpotifyLogin() {
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
    var isLogin = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpotifyLogin.shared.getAccessToken { [weak self] (token, error) in
            if  token == nil {
                self?.prepareSpotifyLogin()
                self?.isLogin = false
            }else{
               self?.isLogin = true
            }
            
        }
       
    }
    override func viewDidAppear(_ animated: Bool) {
        if isLogin { self.loginSuccessful()}
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton?.center = self.view.center
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func checkSpotifyAccessToken() {
     
    }
    
    @objc func loginSuccessful() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        self.present(controller, animated: true, completion: nil)

    }


}
