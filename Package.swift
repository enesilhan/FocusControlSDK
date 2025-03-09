// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FocusControlSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v11),
        .watchOS(.v7)
    ],
    products: [
        .library(
            name: "FocusControlSDK",
            targets: ["FocusControlSDK"]),
    ],
    targets: [
        .target(
            name: "FocusControlSDK"),
    ]
)
