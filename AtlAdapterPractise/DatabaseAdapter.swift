//
//  DatabaseAdapter.swift
//  AtlAdapterPractise
//
//  Created by Ayan on 06.01.24.
//

import Foundation
import KeychainSwift

class DatabaseAdapter {
    
    let keychain = KeychainSwift()
    
    func saveUserData (user: User) {
        UserDefaults.standard.setValue(user.name, forKey: "name")
        UserDefaults.standard.setValue(user.surname, forKey: "surname")
        keychain.set(user.email, forKey: "email")
        keychain.set(user.password, forKey: "password")
    }
    
    func printUserData () {
        print(UserDefaults.standard.object(forKey: "name" ) ?? "")
        print(keychain.get("email") ?? "")
    }
}
