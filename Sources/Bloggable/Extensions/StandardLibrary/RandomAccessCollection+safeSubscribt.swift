//
//  RandomAccessCollection+safeSubscribt.swift
//  Bloggable
//
//  Created by David Nadoba on 18.10.17.
//

import Foundation

extension RandomAccessCollection {
    subscript(safe index: Index) -> Element? {
        get {
            guard index >= startIndex, index < self.endIndex else {
                return nil
            }
            return self[index]
        }
    }
}
