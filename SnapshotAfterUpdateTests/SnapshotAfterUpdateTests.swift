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
        sut.view.setNeedsDisplay()
        assertSnapshot(matching: sut, as: .wait(for: 2, on: .image))
    }
}
