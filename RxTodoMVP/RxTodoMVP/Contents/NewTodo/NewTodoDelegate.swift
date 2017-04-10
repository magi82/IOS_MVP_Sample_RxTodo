//
//  NewTodoDelegate.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

// MARK: - View implement

protocol NewTodoViewDelegate: class {
  func dismissView()
}

// MARK: - Presenter implement

protocol NewTodoPresenterDelegate {
  func configure(_: NewTodoViewDelegate)
  func addNewTodo(title: String, date: String, state: String)
}

protocol NewTodoCallbackFromInteractor: class {
  func onSuccess()
  func onFailure()
}

// MARK: - Interactor implement

protocol NewTodoInteractorDelegate {
  func configure(_: NewTodoCallbackFromInteractor)
  func addNewTodo(title: String, date: String, state: String)
}
