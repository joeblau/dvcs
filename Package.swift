// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "DVCS",
    dependencies: [
        .package(
            url: "https://github.com/vapor/vapor.git",
            from: "3.0.0"
        ),
    ],
    targets: [
        // gi API
        .target(
            name: "giAPI",
            dependencies: ["GitignoreEngineKit", "Vapor"],
            path: "./servers/gi-api/Sources"
        ),
        .testTarget(
            name: "giAPITests",
            dependencies: ["giAPI"],
            path: "./servers/gi-api/Tests"
        ),
        // gitignore Engine
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
