//
//  LoginAdapter.swift
//  AtlAdapterPractise
//
//  Created by Ayan on 06.01.24.
//

import Foundation
import GoogleSignIn

enum LoginType {
    case google
    case facebook
    case apple
}

class LoginAdapter {
    
    var controller: UIViewController
    var completion: ((User) -> Void)?
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func login (type: LoginType) {
        switch type {
        case .google:
            googleSignIn()
        case .facebook:
            facebookSignIn()
        case .apple:
            appleSignIn()
        }
    }
    
    fileprivate func googleSignIn () {
        GIDSignIn.sharedInstance.signIn(withPresenting: controller) { result, error in
            if let error {
                print(error.localizedDescription)
            } else if let result {
                let user = User(name: result.user.profile?.name ?? "",
                                surname: result.user.profile?.familyName ?? "",
                                email: result.user.profile?.email ?? "",
                                password: "")
                self.completion?(user)
            }
        }
    }
    
    fileprivate func facebookSignIn () {
        
    }
    
    fileprivate func appleSignIn () {
        
    }
}
