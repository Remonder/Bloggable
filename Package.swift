// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bloggable",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "1.7.9"))
    ],
    targets: [
        .target(
            name: "Bloggable",
            dependencies: ["Kitura"])
    ]
)
