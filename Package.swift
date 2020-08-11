// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Inject",
    // hope to remove platform requirements in the future https://github.com/birdrides/mockingbird/issues/164
    platforms: [
        .macOS(.v10_14),
        .iOS(.v8),
        .tvOS(.v9),
    ],
    products: [],
    dependencies: [
        .package(url: "git@github.com:dooZdev/Resolver.git", .branch("experiment/propertyWrappersWithArguments")),
        .package(url: "git@github.com:birdrides/mockingbird.git", .upToNextMajor(from: "0.14.1"))
    ],
    targets: [
        .target(
            name: "UseCaseInject",
            dependencies: ["Resolver"]),
        .testTarget(
            name: "UseCaseInjectTests",
            dependencies: ["UseCaseInject", "Mockingbird"]
        ),
    ]
)
