//
//  AlertHandler.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import UIKit

//Static class in Swift - Struct with private init OR final class with private init
struct AlertHandler {
    //Prevent to instantiate the AlertHandler
    private init() {
        
    }
    
    //Create an alert controller with message and one button "Ok"
    static func alertMessage(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(actionOk)
        
        return alert
    }
    
    //Create an alert controller with title "Error", message and one button "Ok"
    static func alertError(message: String) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(actionOk)
        
        return alert
    }
}
