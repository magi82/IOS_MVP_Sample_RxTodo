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
  
  weak var view: MainViewDelegate?
  var interactor: MainInteractorDelegate = MainInteractor()
}

// MARK: - MainPresenterDelegate

extension MainPresenter: MainPresenterDelegate {
  
  func configure(_ view: MainViewDelegate) {
    self.view = view
    interactor.configure(self)
    
    interactor.getList()
  }
}

// MARK: - MainInteractorCallback

extension MainPresenter: MainCallbackFromInteractor {
  
  func onSuccess(_ list: [DisplayViewModel]) {
    self.view?.setTodoList(list)
  }
  
  func onFailure() {
  }
}
