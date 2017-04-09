//
//  MainInteractor.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 9..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class MainInteractor {
  
  // MARK: Properties
  
  weak var callback: MainCallbackFromInteractor?
}

// MARK: - MainInteractorDelegate

extension MainInteractor: MainInteractorDelegate {
  
  func configure(_ callback: MainCallbackFromInteractor) {
    self.callback = callback
  }
  
  func getList() {
    var list: [DisplayViewModel] = []
    
    for value in LocalDataSource.getList() {
      list.append(DisplayViewModel(title: value.title))
    }

    callback?.onSuccess(list)
  }
}
