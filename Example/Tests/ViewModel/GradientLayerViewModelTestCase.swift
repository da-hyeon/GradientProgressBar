//
//  GradientLayerViewModelTestCase.swift
//  GradientProgressBar_Example
//
//  Created by Felix Mau on 28.08.19.
//  Copyright © 2019 Felix Mau. All rights reserved.
//

import XCTest

@testable import GradientProgressBar
@testable import LightweightObservable

class GradientLayerViewModelTestCase: XCTestCase {
    // MARK: - Private properties

    private var viewModel: GradientLayerViewModel!

    // MARK: - Public methods

    override func setUp() {
        super.setUp()

        viewModel = GradientLayerViewModel()
    }

    override func tearDown() {
        viewModel = nil

        super.tearDown()
    }

    // MARK: - Test initializer

    func testInitializerShouldSetGradientLayerColorsToStaticConfigurationPropertyMappedToCgColor() {
        // Given
        let expectedGradientLayerColors = UIColor.GradientProgressBar.gradientColors.cgColor

        // Then
        XCTAssertEqual(viewModel.gradientLayerColors.value, expectedGradientLayerColors)
    }

    func testInitializerShouldSetGradientColorsToStaticConfigurationProperty() {
        XCTAssertEqual(viewModel.gradientColors, UIColor.GradientProgressBar.gradientColors)
    }

    // MARK: - Test setting property `gradientColors`

    func testSettingsGradientColorsShouldUpdateGradientLayerColors() {
        // Given
        let gradientColors: [UIColor] = [.red, .yellow, .green]

        // When
        viewModel.gradientColors = gradientColors

        // Then
        let expectedGradientLayerColors = gradientColors.cgColor
        XCTAssertEqual(viewModel.gradientLayerColors.value, expectedGradientLayerColors)
    }
}

// MARK: - Helpers

private extension Array where Element: UIColor {
    /// The Quartz color that corresponds to the color objects.
    var cgColor: [CGColor] {
        map { $0.cgColor }
    }
}
