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
  var presenter: NewTodoPresenterDelegate { get set }
  
  func dismissView()
}

// MARK: - Presenter implement

protocol NewTodoPresenterDelegate {
  weak var view: NewTodoViewDelegate? { get set }
  
  func configure(_: NewTodoViewDelegate)
  func addNewTodo(title: String, date: String, state: String)
}
