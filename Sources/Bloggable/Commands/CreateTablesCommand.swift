//
//  CreateTablesCommand.swift
//  BloggablePackageDescription
//
//  Created by Steffen Ryll on 17.10.17.
//

import Commandant
import Foundation
import Result
import SwiftKueryMySQL

struct CreateTablesCommand : CommandProtocol {
    var verb = "createTables"
    var function = "Creates the database tables."
    
    public func run(_ options: NoOptions<String>) -> Result<(), String> {
        let connection = MySQLConnection(user: "root", database: "blog")
        connection.connect { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            let articleTable = Article.TableV0()
            articleTable.create(connection: connection) { result in
                print(result)
                connection.closeConnection()
            }
        }
        return .success(())
    }
}
