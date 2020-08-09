// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Inject",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v8),
        .tvOS(.v9),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Inject",
            targets: ["Inject"]),
    ],
    dependencies: [
        .package(url: "git@github.com:dooZdev/Resolver.git", .branch("develop"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Inject",
            dependencies: []),
        .target(
            name: "UseCaseInject",
            dependencies: ["Resolver"]),
        .testTarget(
            name: "UseCaseInjectTests",
            dependencies: ["UseCaseInject"]
        ),
    ]
)
