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
import SwiftKuery
import SwiftKueryMySQL

struct RunServerCommand : CommandProtocol {
    var verb = "runServer"
    var function = "Runs the server."
    
    public func run(_ options: NoOptions<String>) -> Result<(), String> {
        
        let connection = MySQLConnection.makeWithDefaultParameters()
        connection.connect {
            if let error = $0 {
                print(error)
            } else {
                print("successful connected to MySQL server.")
            }
        }
        
        let router = Router()
        router.get("/") { _, response, next in
            response.send("START\n")
            let query = Select(from: Article.TableV0())
            connection.execute(query: query) { queryResult in
                let articles = queryResult.asResultSet.flatMap{ try? $0.decode(Article.self) }
                
                articles?.forEach { article in
                    response.send(article.title + "\n")
                }
            }
            response.send("END\n")
            next()
        }
        
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
        
        return .success(())
    }
}
