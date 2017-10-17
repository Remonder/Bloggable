//
//  Article.swift
//  Bloggable
//
//  Created by Steffen Ryll on 17.10.17.
//

import SwiftKuery

struct Article {
    let id: Int
    let title: String
    let content: String
}

// MARK: - Table

extension Article {
    class TableV0 : Table {
        let tableName = "Articles"
        let id = Column("id", Int64.self, autoIncrement: true, primaryKey: true, notNull: true, unique: true)
        let title = Column("title", Varchar.self, length: 128, primaryKey: true, notNull: true, check: "LEN(title) > 0")
        let content = Column("content", String.self, primaryKey: true, notNull: true, check: "LEN(content) > 0")
    }
}
