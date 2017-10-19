//
//  ProcessInfo.swift
//  BloggablePackageDescription
//
//  Created by David Nadoba on 19.10.17.
//

import Foundation

extension ProcessInfo {
    struct EnvironmentKey {
        static let databaseName = "DATABASE_NAME"
        static let databaseUser = "DATABASE_USER"
        static let databasePassword = "DATABASE_PASSWORD"
    }
    static var databaseName: String? {
        return ProcessInfo.processInfo.environment[EnvironmentKey.databaseName]
    }
    static var databaseUser: String? {
        return ProcessInfo.processInfo.environment[EnvironmentKey.databaseUser]
    }
    static var databasePassword: String? {
        return ProcessInfo.processInfo.environment[EnvironmentKey.databasePassword]
    }
}
