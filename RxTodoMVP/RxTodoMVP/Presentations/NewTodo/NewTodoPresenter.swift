//
//  NewTodoPresenter.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class NewTodoPresenter {
  
  // MARK: Properties
  
  weak fileprivate var view: NewTodoViewDelegate?
  
}

// MARK: - NewTodoPresenterDelegate

extension NewTodoPresenter: NewTodoPresenterDelegate {
  
  func attachView(_ view: NewTodoViewDelegate) {
    self.view = view
  }
  
  func detachView() {
    view = nil
  }
  
  func configure() {
  }
}
