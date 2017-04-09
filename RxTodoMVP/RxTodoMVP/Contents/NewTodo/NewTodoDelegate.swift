//
//  NewTodoDelegate.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

protocol NewTodoViewDelegate: class {
  
}

protocol NewTodoPresenterDelegate {
  
  func attachView(_: NewTodoViewDelegate)
  
  func detachView()
  
  func configure()
}
