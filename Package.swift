// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Inject",
    // The platforms are needed for mockingbird, Resolver can work on any platform potentially.
    platforms: [
        .macOS(.v10_14),
        .iOS(.v8),
        .tvOS(.v9),
    ],
    products: [],
    dependencies: [
        .package(url: "git@github.com:dooZdev/Resolver.git", .branch("experiment/propertyWrappersWithArguments")),
        .package(url: "https://github.com/birdrides/mockingbird.git", .upToNextMajor(from: "0.14.0"))
    ],
    targets: [
        .target(
            name: "UseCaseInject",
            dependencies: ["Resolver"]),
        
        // This should include mockingbird but there is a problem https://github.com/birdrides/mockingbird/issues/164
        // uncomment when generating tests
//        .testTarget(
//            name: "UseCaseInjectTests",
//            dependencies: ["UseCaseInject"]
//        ),
    ]
)
