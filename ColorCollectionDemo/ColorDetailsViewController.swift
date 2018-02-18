//
//  ColorDetailsViewController.swift
//  ColorCollectionDemo
//
//  Created by Oleg Chernyshenko on 28/01/18.
//  Copyright © 2018 Tugboat. All rights reserved.
//

import UIKit

class ColorDetailsPresenter {
  let color: String
  let colorDescription: String

  init(with hexColor: String) {
    self.color = hexColor
    self.colorDescription = "Hex color: \(hexColor)"
  }
}

class ColorDetailsViewController: UIViewController {
  let presenter: ColorDetailsPresenter!
  init(with presenter: ColorDetailsPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.init(hexString: presenter.color)
    self.view.addSubview(descriptionLabel)
    setupConstraints()
    descriptionLabel.text = presenter.colorDescription

    let tapRecognizer = UITapGestureRecognizer(target: self,
                                               action: #selector(self.onTap))
    self.view.addGestureRecognizer(tapRecognizer)
  }

  @objc func onTap() {
    self.dismiss(animated: true, completion: nil)
  }

  func setupConstraints() {
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    descriptionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
  }

  let descriptionLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.font = UIFont.systemFont(ofSize: 40)
    label.textColor = .white
    label.numberOfLines = 0
    return label
  }()
}
