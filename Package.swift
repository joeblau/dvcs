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
            path: "./Sources/Servers/GitignoreAPI/Sources"
        ),
        .testTarget(
            name: "GitignoreAPITests",
            dependencies: ["GitignoreAPI"],
            path: "./Tests/Servers/GitignoreAPI/Tests"
        ),
        // gitignore Engine
        .target(
            name: "GitignoreEngineKit",
            dependencies: [],
            path: "./Sources/Libraries/GitignoreEngineKit/Sources"
        ),
        .testTarget(
            name: "GitignoreEngineKitTests",
            dependencies: ["GitignoreEngineKit"],
            path: "./Tests/Libraries/GitignoreEngineKit/Tests"
        ),
    ]
)
