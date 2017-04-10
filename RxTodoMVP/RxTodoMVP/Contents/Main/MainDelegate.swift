//
//  MainDelegate.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

// MARK: - View implement

protocol MainViewDelegate: class {
  var presenter: MainPresenterDelegate { get set }
  
  func setTodoList(_ todoList: [DisplayViewModel])
}

// MARK: - Presenter implement

protocol MainPresenterDelegate {
  weak var view: MainViewDelegate? { get set }
  var interactor: MainInteractorDelegate { get set }
  
  func configure(_: MainViewDelegate)
}

protocol MainCallbackFromInteractor: class {
  func onSuccess(_: [DisplayViewModel])
  func onFailure()
}

// MARK: - Interactor implement

protocol MainInteractorDelegate {
  weak var callback: MainCallbackFromInteractor? { get set }
  
  func configure(_: MainCallbackFromInteractor)
  func getList()
}
