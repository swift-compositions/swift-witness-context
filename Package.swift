// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-witness-context",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27"),
    ],
    products: [
        .library(
            name: "Witness Context",
            targets: ["WitnessContext"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-compositions/swift-witnesses.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "WitnessContext",
            dependencies: [
                .product(name: "Witnesses", package: "swift-witnesses"),
            ]
        ),
        .testTarget(
            name: "Witness Context Tests",
            dependencies: ["WitnessContext"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem
}
