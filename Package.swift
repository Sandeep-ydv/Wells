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
		.package(url: "https://github.com/Sandeep-ydv/Background", revision: "f802a457e8144b98687992598369692cda43b9ee")
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
