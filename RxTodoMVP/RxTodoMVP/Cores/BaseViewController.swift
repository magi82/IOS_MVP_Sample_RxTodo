//
//  BaseViewController.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 7..
//  Copyright © 2017년 magi82. All rights reserved.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
  
  // MARK: Properties
  
  let dispose = DisposeBag()
  
  // MARK: Initializing
  
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Layout Contraints
  
  private(set) var didSetupConstraints = false
  
  override func viewDidLoad() {
    self.view.setNeedsUpdateConstraints()
  }
  
  override func updateViewConstraints() {
    if self.didSetupConstraints == false {
      self.setupConstraints()
      self.didSetupConstraints = true
    }
    super.updateViewConstraints()
  }
  
  func setupConstraints() { }
}
