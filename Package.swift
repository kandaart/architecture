// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Architecture",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Architecture",
            targets: ["Architecture"]
        )
    ],
    dependencies: [
        .package(name: "ReactiveKit", url: "https://github.com/DeclarativeHub/ReactiveKit.git", from: "3.18.3")
    ],
    targets: [
        .target(
            name: "Architecture",
            dependencies: ["ReactiveKit"]
        )
    ]
)
