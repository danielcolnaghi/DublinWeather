//
//  LogHandler.swift
//  DublinWeather
//
//  Created by Daniel Colnaghi on 07/02/2019.
//  Copyright © 2019 Daniel Colnaghi. All rights reserved.
//

import Foundation

//Static class in Swift - Struct with private init OR final class with private init
struct LogHandler {
    //Prevent to instantiate the LogHandler
    private init() {
        
    }
    
    static func log(_ msg: String) {
        printMessage("🔨 \(msg)")
    }
    
    static func error(_ msg: String) {
        printMessage("‼️ \(msg)")
    }
    
    static func warning(_ msg: String) {
        printMessage("⚠️ \(msg)")
    }
    
    private static func printMessage(_ msg: String) {
        #if DEBUG
        print(msg)
        #endif
    }
}
