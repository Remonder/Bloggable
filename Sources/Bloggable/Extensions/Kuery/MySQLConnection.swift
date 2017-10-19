//
//  MySQLConnection.swift
//  Bloggable
//
//  Created by David Nadoba on 19.10.17.
//

import Foundation
import SwiftKueryMySQL

extension MySQLConnection {
    static func makeWithDefaultParameters() -> MySQLConnection {
        let connection = MySQLConnection(
            user: ProcessInfo.databaseUser ?? "root",
            password: ProcessInfo.databasePassword ?? "",
            database: ProcessInfo.databaseName ?? "blog"
        )
        return connection
    }
}
