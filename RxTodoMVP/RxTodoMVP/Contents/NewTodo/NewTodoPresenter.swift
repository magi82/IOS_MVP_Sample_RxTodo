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
  
  weak var view: NewTodoViewDelegate?
  var interactor: NewTodoInteractorDelegate = NewTodoInteractor()
}

// MARK: - NewTodoPresenterDelegate

extension NewTodoPresenter: NewTodoPresenterDelegate {
  
  func configure(_ view: NewTodoViewDelegate) {
    self.view = view
    interactor.configure(self)
  }
  
  func addNewTodo(title: String, date: String, state: String) {
    interactor.addNewTodo(title: title, date: date, state: state)
  }
}

// MARK: - NewTodoInteractorCallback

extension NewTodoPresenter: NewTodoCallbackFromInteractor {
  
  func onSuccess() {
    view?.dismissView()
  }
  
  func onFailure() {
  }
}
