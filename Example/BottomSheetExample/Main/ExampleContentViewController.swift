//
//  ExampleContentViewController.swift
//  BottomSheetExample
//
//  Created by Patrick Kladek on 18.04.21.
//

import UIKit

final class ExampleContentViewController: UIViewController {

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .red

        // NOTE: Workaround for warnings related to _UITemporaryLayoutHeight
        // https://stackoverflow.com/questions/30106522/ios-uitemporarylayoutheight-constraint
        let constraint = self.view.heightAnchor.constraint(equalToConstant: 300)
        constraint.priority = .defaultHigh
        constraint.isActive = true

        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }
}
