//
//  RunServerCommand.swift
//  BloggablePackageDescription
//
//  Created by Steffen Ryll on 17.10.17.
//

import Commandant
import Foundation
import Kitura
import Result

struct RunServerCommand : CommandProtocol {
    var verb = "runServer"
    var function = "Runs the server."
    
    public func run(_ options: NoOptions<String>) -> Result<(), String> {
        let router = Router()
        router.get("/") { _, response, next in
            response.send("Hello, World!")
            next()
        }
        
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
        
        return .success(())
    }
}

