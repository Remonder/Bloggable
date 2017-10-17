// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

//
//  Package.swift
//  Bloggable
//
//  Created by Steffen Ryll on 17.10.17.
//

import PackageDescription

let package = Package(
    name: "Bloggable",
    dependencies: [
        .package(url: "https://github.com/Carthage/Commandant.git", from: "0.12.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "1.7.9")),
        .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", .upToNextMinor(from: "0.13.2"))
    ],
    targets: [
        .target(
            name: "Bloggable",
            dependencies: ["Commandant", "Kitura", "SwiftKueryMySQL"])
    ]
)
