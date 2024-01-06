//
//  ViewController.swift
//  AtlAdapterPractise
//
//  Created by Ayan on 06.01.24.
//

import UIKit
import GoogleSignIn

class LoginController: UIViewController {
    var adapter: LoginAdapter?
    let databaseAdapter = DatabaseAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        adapter = LoginAdapter(controller: self)
        adapter?.completion = { [weak self] user in
            self?.databaseAdapter.saveUserData(user: user)
        }
        databaseAdapter.printUserData()
    }
    
    @IBAction func googleButtonTapped(_ sender: Any) {
        adapter?.login(type: .google)
    }
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
        adapter?.login(type: .facebook)
    }
    
    @IBAction func appleButtonTapped(_ sender: Any) {
        adapter?.login(type: .apple)
    }
}

