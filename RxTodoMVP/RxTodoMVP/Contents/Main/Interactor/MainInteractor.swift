//
//  MainInteractor.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 9..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

import RxSwift

final class MainInteractor {
  
  // MARK: Properties
  
  weak var callback: MainCallbackFromInteractor?
  let dispose = DisposeBag()
}

// MARK: - MainInteractorDelegate

extension MainInteractor: MainInteractorDelegate {
  
  func configure(_ callback: MainCallbackFromInteractor) {
    self.callback = callback
  }
  
  func getList() {
    Observable.from(LocalDataSource.getList())
      .map { value in
        return DisplayViewModel(title: value.title)
      }
      .toArray()
      .subscribe(onNext: { [weak self] value in
        self?.callback?.onSuccess(value)
      })
      .addDisposableTo(dispose)
  }
}
