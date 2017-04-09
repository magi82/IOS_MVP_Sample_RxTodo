//
//  NewTodoViewController.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import UIKit

final class NewTodoViewController: BaseViewController {
  
  // MARK: Properties
  
  let presenter: NewTodoPresenterDelegate
  
  // MARK: Initalizing
  
  init(presenter: NewTodoPresenterDelegate) {
    self.presenter = presenter
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    presenter.detachView()
  }
  
  // MARK: NewTodoViewController Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.attachView(self)
    presenter.configure()
  }
  
  override func setupConstraints() {
    
  }
}

// MARK: - NewTodoViewDelegate

extension NewTodoViewController: NewTodoViewDelegate {
  
}
