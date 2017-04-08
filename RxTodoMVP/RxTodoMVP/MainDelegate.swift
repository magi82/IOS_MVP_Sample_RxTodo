//
//  MainDelegate.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

protocol MainViewDelegate: NSObjectProtocol {
  func setTodoList(_ todoList: [String])
}

protocol MainPresenterDelegate {
  
  func attachView(_: MainViewDelegate)
  
  func detachView()
  
  func configure()
}
