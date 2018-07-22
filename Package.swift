// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Systems",
    dependencies: [
        .package(
            url: "https://github.com/vapor/vapor.git",
            from: "3.0.0"
        ),
    ],
    targets: [
        // Gitignore.io App
        .target(
            name: "GiIO",
            dependencies: ["GitignoreEngineKit", "Vapor"],
            path: "./servers/gi-io/Sources"
        ),
        .testTarget(
            name: "GiIOTests",
            dependencies: ["GiIO"],
            path: "./servers/gi-io/Tests"
        ),
        // Gitignore.io Engine
        .target(
            name: "GitignoreEngineKit",
            dependencies: [],
            path: "./libraries/gitignore-engine-kit/Sources"
        ),
        .testTarget(
            name: "GitignoreEngineKitTests",
            dependencies: ["GitignoreEngineKit"],
            path: "./libraries/gitignore-engine-kit/Tests"
        ),
    ]
)
