// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "estrutura-de-dados",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "estrutura-de-dados",
            targets: ["estrutura-de-dados"]),
        .executable(name: "main", targets: ["main"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "estrutura-de-dados"),
        .testTarget(
            name: "estrutura-de-dadosTests",
            dependencies: ["estrutura-de-dados"]),
        .executableTarget(name: "main")
    ]
)
