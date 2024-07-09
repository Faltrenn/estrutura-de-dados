// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EstruturaDeDados",
    products: [
        .library(
            name: "EstruturaDeDados",
            targets: ["EstruturaDeDados"]),
    ],
    targets: [
        .target(
            name: "EstruturaDeDados"),
        .testTarget(
            name: "EstruturaDeDadosTests",
            dependencies: ["EstruturaDeDados"]),
    ]
)
