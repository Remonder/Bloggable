// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bloggable",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "1.7.9")),
        .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", .upToNextMinor(from: "0.13.2"))
    ],
    targets: [
        .target(
            name: "Bloggable",
            dependencies: ["Kitura", "SwiftKueryMySQL"])
    ]
)
