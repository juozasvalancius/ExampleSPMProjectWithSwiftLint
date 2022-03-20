// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "MyApp",
    products: [
        .executable(name: "MyApp", targets: ["MyApp"]),
    ],
    targets: [
        // 1. Specify where to download the compiled swiftlint tool from.
        .binaryTarget(
            name: "SwiftLintBinary",
            url: "https://github.com/juozasvalancius/SwiftLint/releases/download/spm-accommodation/SwiftLintBinary-macos.artifactbundle.zip",
            checksum: "cdc36c26225fba80efc3ac2e67c2e3c3f54937145869ea5dbcaa234e57fc3724"
        ),
        // 2. Define the SPM plugin.
        .plugin(
            name: "SwiftLintXcode",
            capability: .buildTool(),
            dependencies: ["SwiftLintBinary"]
        ),
        // 3. Use the plugin in your project.
        .executableTarget(
            name: "MyApp",
            plugins: ["SwiftLintXcode"]
        )
    ]
)
