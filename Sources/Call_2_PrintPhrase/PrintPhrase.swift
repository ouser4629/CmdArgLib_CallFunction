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

// Something to try
//
//  Change the release typeFormatter to lowercased underlined
//  Build and run this:
//    ./cf2-print -help-me-if-you-can

import CmdArgLib
import CmdArgLibMacros
import Foundation

typealias Count = Int
typealias Phrase = String

@main
struct PrintCount {
    @CallFunction
    static func cf2Print (
        i include: Flag,
        u upper: Flag,
        r__repeats repeats: Count = 1,
        _ phrase: Phrase,
        h_helpMeIfYouCan_help help: MetaFlag = helpMetaFlag) async throws -> Int
    {
        let count = max(repeats, 1)
        for counter in 1...count {
            let label = include ? "\(counter) " : ""
            var line = "--> \(label)\(phrase)"
            if upper {
                line = line.uppercased()
            }
            print(line)
        }
        return phrase.components(separatedBy: .whitespaces).count
    }

    private static let helpElements: [ShowElement] = [
        .text("DESCRIPTION:\n", "Print a phrase multiple times followed by the number of words in the phrase."),
        .synopsis("\nUSAGE:"),
        .text("\nPARAMETERS:"),
        .parameter("phrase", "The phrase to be printed"),
        .parameter("include", "Print a line counter before each phrase"),
        .parameter("upper", "Print output in upper case"),
        .parameter("repeats", "Times to print each phrase"),
        .parameter("help","Print this help screen")
    ]

    static let helpMetaFlag = MetaFlag(helpElements: helpElements)

    static func main() async {
        do {
            var (_, words) = commandLineNameAndWords()
            if words.isEmpty {words = ["--help"]}
            let wordCount = try await call(words: words)
            print("--> The phrase has \(wordCount) words")
        } catch {
            Exception.printAndExit(for: error, callNames: ["c2Print"])
        }
        return
    }
}
