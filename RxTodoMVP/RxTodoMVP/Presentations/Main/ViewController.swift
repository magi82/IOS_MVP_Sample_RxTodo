//
//  ViewController.swift
//  RxTodoMVP
//
//  Created by Byung Kook Hwang on 2017. 4. 6..
//  Copyright © 2017년 magi82. All rights reserved.
//

import UIKit

final class ViewController: BaseViewController {

  // MARK: Properties

  var presenter: MainPresenterDelegate
  
  // MARK: Initializing
  
  init(presenter: MainPresenterDelegate) {
    self.presenter = presenter
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    presenter.detachView()
  }
  
  // MARK: ViewController Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    presenter.attachView(self)
    
    presenter.setData("asdf")
  }
  
  override func setupConstraints() {
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// MARK: - MainViewDelegate

extension ViewController: MainViewDelegate {
  
  func showData(_ value: String) {
    print(value)
  }
}
