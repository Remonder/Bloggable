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
        let connection = MySQLConnection(user: "root", database: "blog")
        connection.connect { print($0?.localizedDescription ?? "No Error") }
        
        let router = Router()
        router.get("/") { _, response, next in
            response.send("START\n")
            let query = Select(from: Article.TableV0())
            connection.execute(query: query) { queryResult in
                if let resultSet = queryResult.asResultSet {
                    do {
                        let articles = try resultSet.decode(Article.self)
                        for article in articles {
                            response.send(article.title + "\n")
                        }
                    } catch {
                        response.send(error.localizedDescription)
                        print(error)
                    }
                    
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
