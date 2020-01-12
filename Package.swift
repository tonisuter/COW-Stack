// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "COW-Stack",
    products: [
        .library(name: "Stack", targets: ["Stack"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Stack"),
        .target(name: "Main", dependencies: ["Stack"]),
        .testTarget(name: "StackTests", dependencies: ["Stack"]),
    ]
)
