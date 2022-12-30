// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "c-search",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]),
        .library(
            name: "Data",
            targets: ["Data"]),
        .library(
            name: "Extension",
            targets: ["Extension"]),
    ],
    dependencies: [
         .package(url: "https://github.com/ishkawa/APIKit", from: "5.4.0"),
         .package(url: "https://github.com/CoreOffice/XMLCoder", from: "0.15.0"),
         .package(path: "ArkanaKeys"),
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: ["ArkanaKeys"]),
        .target(
            name: "Data",
            dependencies: ["APIKit", "XMLCoder", "Extension"]),
        .target(
            name: "Extension",
            dependencies: []),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]),
    ]
)
