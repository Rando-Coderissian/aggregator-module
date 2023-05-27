// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "aggregator-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "AggregatorModule", targets: ["AggregatorModule"]),
        .library(name: "AggregatorApi", targets: ["AggregatorApi"]),
    ],
    dependencies: [
		.package(path: "../feather-core"),
//        .package(url: "https://github.com/feathercms/feather-core", .branch("dev")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.2.3"),
    ],
    targets: [
        .target(name: "AggregatorApi", dependencies: [
            .product(name: "ApiController", package: "feather-core"),
        ]),
        .target(name: "AggregatorModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "Kanna", package: "Kanna"),

            .target(name: "AggregatorApi"),
        ],
        resources: [
//            .copy("Bundle"),
        ]),
    ]
    
)
