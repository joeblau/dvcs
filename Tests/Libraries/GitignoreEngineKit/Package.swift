// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GitignoreEngineKit",
    products: [
        .library(
            name: "GitignoreEngineKit",
            targets: ["gitignore-engine-kit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "gitignore-engine-kit",
            dependencies: []
        ),
        .testTarget(
            name: "gitignore-engine-kitTests",
            dependencies: ["gitignore-engine-kit"]
        ),
    ]
)
