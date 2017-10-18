//
//  ResultSet.swift
//  Bloggable
//
//  Created by David Nadoba on 18.10.17.
//

import Foundation
import SwiftKuery


extension ResultSet {
    func decode<T>(_ type: T.Type) throws -> [T] where T: Decodable {
        let decoder = QueryResultDecoder(titles: titles)
        return try self.rows.map {
            try decoder.decode(T.self, from: $0)
        }
    }
}
