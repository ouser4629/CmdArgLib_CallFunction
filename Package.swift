// Copyright (c) 2025 Peter Buenafuente Summerland
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// swift-tools-version: 6.2
import PackageDescription

//let cmdArgLib = "CMD_ARG_LIB"
let cmdArgLib = "cmd-arg-lib"

let package = Package(
    name: "CallFunctionExamples",
    platforms: [.macOS(.v26)],

    products: [
        .executable(name: "cf1-print", targets: ["Call_1_PrintPhrase"]),
        .executable(name: "cf2-print", targets: ["Call_2_PrintPhrase"]),
    ],

    dependencies: [
        .package(url: "https://github.com/ouser4629/cmd-arg-lib.git", from: "0.3.8")
        //        .package(path: "../../\(cmdArgLib)"),
    ],

    targets: [
        .executableTarget(
            name: "Call_1_PrintPhrase",
            dependencies: [
                .product(name: "CmdArgLib", package: cmdArgLib),
                .product(name: "CmdArgLibMacros", package: cmdArgLib),
            ],
            path: "Sources/Call_1_PrintPhrase"),
        .executableTarget(
            name: "Call_2_PrintPhrase",
            dependencies: [
                .product(name: "CmdArgLib", package: cmdArgLib),
                .product(name: "CmdArgLibMacros", package: cmdArgLib),
            ],
            path: "Sources/Call_2_PrintPhrase"),
    ]
)
