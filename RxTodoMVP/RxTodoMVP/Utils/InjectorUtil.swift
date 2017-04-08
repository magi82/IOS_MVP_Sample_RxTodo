//
//  InjectorUtil.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class InjectorUtil {
  
  // MARK: Singleton
  
  static let sharedInstance = InjectorUtil()
  
  static func getInstance() -> InjectorUtil {
    return sharedInstance
  }
  
  // MARK: provide
  
  func provideMainPresenter() -> MainPresenterDelegate {
    return MainPresenter()
  }
}
