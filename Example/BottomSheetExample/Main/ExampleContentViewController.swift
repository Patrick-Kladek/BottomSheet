//
//  ExampleContentViewController.swift
//  BottomSheetExample
//
//  Created by Patrick Kladek on 18.04.21.
//

import UIKit

final class ExampleContentViewController: UIViewController {

  private lazy var titleLabel = self.makeTitleLabel()
  private lazy var descriptionLabel = self.makeDescriptionLabel()
  private lazy var button = self.makeStyleButton()

  private lazy var contentStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, button])
    stack.axis = .vertical
    stack.spacing = 16
    stack.setCustomSpacing(24, after: descriptionLabel)
    return stack
  }()
  
  override func loadView() {
    self.view = UIView()
    if #available(iOS 13.0, *) {
      self.view.backgroundColor = .tertiarySystemBackground
    } else {
      self.view.backgroundColor = .white
    }

    self.view.addSubview(self.contentStack)
    self.contentStack.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      self.contentStack.topAnchor.constraint(equalTo: self.view.topAnchor),
      self.contentStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      self.contentStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      self.contentStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
    ])
  }
}

// MARK: - Private

private extension ExampleContentViewController {

  func makeTitleLabel() -> UILabel {
    let label = UILabel()
    label.text = "BottomSheet"
    label.font = .preferredFont(forTextStyle: .largeTitle)
    label.numberOfLines = 0
    label.textAlignment = .center
    label.setContentHuggingPriority(.defaultHigh, for: .vertical)
    return label
  }

  func makeDescriptionLabel() -> UILabel {
    let label = UILabel()
    label.text = "BottomSheet is a component made with UIKit and completely written in Swift\n🧡"
    label.font = .preferredFont(forTextStyle: .body)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }

  func makeStyleButton() -> UIButton {
    let button = UIButton(type: .system)
    button.backgroundColor = .systemOrange
    button.setTitle("Download", for: .normal)
    button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
    button.setTitleColor(.white, for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    button.layer.cornerRadius = 8
    return button
  }
}
