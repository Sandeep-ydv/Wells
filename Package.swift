// swift-tools-version: 5.8

import PackageDescription

let package = Package(
	name: "Wells",
	platforms: [
		.macOS(.v11),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.macCatalyst(.v13),
	],
	products: [
		.library(name: "Wells", targets: ["Wells"]),
	],
	dependencies: [
		.package(url: "https://github.com/Sandeep-ydv/Background", revision: "3c3ccc3f02cec1a981970320752dad6d29b81cb2")
	],
	targets: [
		.target(name: "Wells", dependencies: ["Background"]),
		.testTarget(name: "WellsTests", dependencies: ["Wells"]),
	]
)

let swiftSettings: [SwiftSetting] = [
	.enableExperimentalFeature("StrictConcurrency")
]

for target in package.targets {
	var settings = target.swiftSettings ?? []
	settings.append(contentsOf: swiftSettings)
	target.swiftSettings = settings
}
