//
//  SnapshotAfterUpdateTests.swift
//  SnapshotAfterUpdateTests
//
//  Created by Maxim Bazarov on 2/11/20.
//  Copyright © 2020 Maxim Bazarov. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SnapshotAfterUpdate


class SnapshotAfterUpdateTests: XCTestCase {
    private var sut = UIStoryboard(
        name: "Main",
        bundle: Bundle(for: ViewController.self)
        ).instantiateInitialViewController()!

    func testExample1() {
        delay(2)
        assertSnapshot(matching: sut, as: .image)
    }
}

func delay(_ second: TimeInterval) {
    let date = Date(timeIntervalSinceNow: second)
    RunLoop.current.run(until: date)
}
