// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "DVCS",
    dependencies: [
        .package(
            url: "https://github.com/vapor/vapor.git",
            from: "3.1.0"
        ),
    ],
    targets: [
        // gi API
        .target(
            name: "GitignoreAPI",
            dependencies: ["GitignoreEngineKit", "Vapor"],
            path: "./Servers/GitignoreAPI/Sources"
        ),
        .testTarget(
            name: "GitignoreAPITests",
            dependencies: ["GitignoreAPI"],
            path: "./Servers/GitignoreAPI/Tests"
        ),
        // gitignore Engine
        .target(
            name: "GitignoreEngineKit",
            dependencies: [],
            path: "./Libraries/GitignoreEngineKit/Sources"
        ),
        .testTarget(
            name: "GitignoreEngineKitTests",
            dependencies: ["GitignoreEngineKit"],
            path: "./Libraries/GitignoreEngineKit/Tests"
        ),
    ]
)
