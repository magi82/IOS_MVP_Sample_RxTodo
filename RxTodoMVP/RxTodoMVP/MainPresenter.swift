//
//  MainPresenter.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 7..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class MainPresenter {
  
  // MARK: Properties
  
  weak fileprivate var view: MainViewDelegate?
}

// MARK: - MainPresenterDelegate attach & detach

extension MainPresenter: MainPresenterDelegate {
  
  func attachView(_ view: MainViewDelegate) {
    self.view = view
  }
  
  func detachView() {
    view = nil
  }
  
  func setData(_ value: String) {
    view?.showData(value)
  }
}
