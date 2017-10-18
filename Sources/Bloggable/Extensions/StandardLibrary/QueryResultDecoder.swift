//
//  QueryResultDecoder.swift
//  Bloggable
//
//  Created by David Nadoba on 18.10.17.
//

import Foundation


enum QueryResultDecoderError: Error {
    
    case notYetImplemented(method: String)
}

class QueryResultDecoder {
    let indexForKeyMap: [String: Int]
    convenience init(titles: [String]) {
        let map = Dictionary.init(uniqueKeysWithValues: zip(titles, 0...))
        self.init(indexForKeyMap: map)
    }
    init(indexForKeyMap: [String: Int]) {
        self.indexForKeyMap = indexForKeyMap
    }
    
    func decode<T: Decodable>(_ type: T.Type, from row: [Any?]) throws -> T {
        let decoder = _QueryResultDecoder(indexForKeyMap: indexForKeyMap, storage: row)
        return try T(from: decoder)
    }
}

class _QueryResultDecoder: Decoder {
    
    let indexForKeyMap: [String: Int]
    let storage: [Any?]
    init(indexForKeyMap: [String: Int], storage: [Any?]) {
        self.indexForKeyMap = indexForKeyMap
        self.storage = storage
    }
    var codingPath: [CodingKey] {
        return []
    }
    
    var userInfo: [CodingUserInfoKey : Any] {
        return [:]
    }
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        let container = _QueryResultKeyedDecodingContainer<Key>(indexForKeyMap: indexForKeyMap, storage: storage)
        return KeyedDecodingContainer(container)
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
}

class _QueryResultKeyedDecodingContainer<K: CodingKey>: KeyedDecodingContainerProtocol {
    var codingPath: [CodingKey] = []
    
    var allKeys: [K] = []
    
    let indexForKeyMap: [String: Int]
    let storage: [Any?]
    
    init(indexForKeyMap: [String: Int], storage: [Any?]) {
        self.indexForKeyMap = indexForKeyMap
        self.storage = storage
    }
    
    private func safeIndex(for key: K) -> Int? {
        return indexForKeyMap[key.stringValue]
    }
    
    private func index(for key: K) throws -> Int {
        guard let index = safeIndex(for: key) else {
            throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: allKeys, debugDescription: "Key is not in indexForKeyMap."))
        }
        return index
    }
    
    private func value<T>(for key: K) throws -> T {
        let index = try self.index(for: key)
        guard let value = storage[safe: index] else {
            throw DecodingError.valueNotFound(T.self, DecodingError.Context(codingPath: allKeys, debugDescription: "value not found at index \(index) for key \(key)"))
        }
        guard let castedValue = value as? T else {
            throw DecodingError.typeMismatch(T.self, DecodingError.Context(codingPath: allKeys, debugDescription: "value at index \(key) for key \(key) could not be casted to type \(T.self)."))
        }
        return castedValue
    }
    
    func contains(_ key: K) -> Bool {
        guard let index = safeIndex(for: key) else {
            return false
        }
        return storage[safe: index] != nil
    }
    
    func decodeNil(forKey key: K) throws -> Bool {
        let index = try self.index(for: key)
        guard let value = storage[safe: index] else {
            return false
        }
        return value == nil
    }
    
    func decode(_ type: Bool.Type, forKey key: K) throws -> Bool {
        return try value(for: key)
    }
    
    func decode(_ type: Int.Type, forKey key: K) throws -> Int {
        return try value(for: key)
    }
    
    func decode(_ type: Int8.Type, forKey key: K) throws -> Int8 {
        return try value(for: key)
    }
    
    func decode(_ type: Int16.Type, forKey key: K) throws -> Int16 {
        return try value(for: key)
    }
    
    func decode(_ type: Int32.Type, forKey key: K) throws -> Int32 {
        return try value(for: key)
    }
    
    func decode(_ type: Int64.Type, forKey key: K) throws -> Int64 {
        return try value(for: key)
    }
    
    func decode(_ type: UInt.Type, forKey key: K) throws -> UInt {
        return try value(for: key)
    }
    
    func decode(_ type: UInt8.Type, forKey key: K) throws -> UInt8 {
        return try value(for: key)
    }
    
    func decode(_ type: UInt16.Type, forKey key: K) throws -> UInt16 {
        return try value(for: key)
    }
    
    func decode(_ type: UInt32.Type, forKey key: K) throws -> UInt32 {
        return try value(for: key)
    }
    
    func decode(_ type: UInt64.Type, forKey key: K) throws -> UInt64 {
        return try value(for: key)
    }
    
    func decode(_ type: Float.Type, forKey key: K) throws -> Float {
        return try value(for: key)
    }
    
    func decode(_ type: Double.Type, forKey key: K) throws -> Double {
        return try value(for: key)
    }
    
    func decode(_ type: String.Type, forKey key: K) throws -> String {
        return try value(for: key)
    }
    
    func decode<T>(_ type: T.Type, forKey key: K) throws -> T where T : Decodable {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
    
    func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: K) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
    
    func nestedUnkeyedContainer(forKey key: K) throws -> UnkeyedDecodingContainer {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
    
    func superDecoder() throws -> Decoder {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
    
    func superDecoder(forKey key: K) throws -> Decoder {
        throw QueryResultDecoderError.notYetImplemented(method: #function)
    }
}


