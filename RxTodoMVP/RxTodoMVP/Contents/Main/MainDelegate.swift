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
  func setTodoList(_ todoList: [DisplayViewModel])
}

// MARK: - Presenter implement

protocol MainPresenterDelegate {
  func configure(_: MainViewDelegate)
  func getList()
}

protocol MainCallbackFromInteractor: class {
  func onSuccess(_: [DisplayViewModel])
  func onFailure()
}

// MARK: - Interactor implement

protocol MainInteractorDelegate {
  func configure(_: MainCallbackFromInteractor)
  func getList()
}
