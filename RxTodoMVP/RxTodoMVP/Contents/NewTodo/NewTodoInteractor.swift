//
//  NewTodoInteractor.swift
//  RxTodoMVP
//
//  Created by 황병국 on 2017. 4. 10..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class NewTodoInteractor {
  
  // MARK: Properties
  
  weak var callback: NewTodoCallbackFromInteractor?
}

// MARK: - NewTodoInteractorDelegate

extension NewTodoInteractor: NewTodoInteractorDelegate {
  
  func configure(_ callback: NewTodoCallbackFromInteractor) {
    self.callback = callback
  }
  
  func addNewTodo(title: String, date: String, state: String) {
    let model = TodoModel(title: title, date: date, state: state)
    
    LocalDataSource.addList(model: model)
    callback?.onSuccess()
  }
}
