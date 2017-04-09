//
//  InjectorUtils.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class InjectorUtils {
  
  // MARK: Singleton
  
  static let sharedInstance = InjectorUtils()
  
  static func getInstance() -> InjectorUtils {
    return sharedInstance
  }
  
  // MARK: provide
  
  func provideMainPresenter() -> MainPresenterDelegate {
    return MainPresenter()
  }
  
  func provideNewTodoPresenter() -> NewTodoPresenterDelegate {
    return NewTodoPresenter()
  }
}
