//
//  NewTodoViewController.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 8..
//  Copyright © 2017년 magi82. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class NewTodoViewController: BaseViewController {
  
  // MARK: Properties
  
  var presenter: NewTodoPresenterDelegate
  
  // MARK: UI Properties
  
  let descriptionLabel = UILabel().then {
    $0.text = "input new todo"
  }
  let todoTextField = UITextField().then {
    $0.borderStyle = .roundedRect
  }
  let okButton = UIButton(type: .system).then {
    $0.setTitle("OK", for: UIControlState.normal)
    $0.isEnabled = false
  }
  let cancelButton = UIButton(type: .system).then {
    $0.setTitle("Cancel", for: UIControlState.normal)
  }
  
  // MARK: Initalizing
  
  init(presenter: NewTodoPresenterDelegate) {
    self.presenter = presenter
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: NewTodoViewController Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.configure(self)
    
    view.addSubview(descriptionLabel)
    view.addSubview(todoTextField)
    view.addSubview(okButton)
    view.addSubview(cancelButton)

    onEventAction()
  }
  
  override func setupConstraints() {
    descriptionLabel.snp.makeConstraints { [weak self] make in
      guard let `self` = self else { return }
      make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(60)
      make.centerX.equalToSuperview()
    }
    
    todoTextField.snp.makeConstraints { [weak self] make in
      guard let `self` = self else { return }
      make.top.equalTo(self.descriptionLabel.snp.bottom).offset(20)
      make.centerX.equalToSuperview()
      make.leading.equalToSuperview().offset(20)
      make.trailing.equalToSuperview().offset(-20)
    }
    
    okButton.snp.makeConstraints { [weak self] make in
      guard let `self` = self else { return }
      make.top.equalTo(self.todoTextField.snp.bottom).offset(30)
      make.trailing.equalTo(self.todoTextField.snp.trailing).multipliedBy(0.8)
    }
    
    cancelButton.snp.makeConstraints { [weak self] make in
      guard let `self` = self else { return }
      make.top.equalTo(self.okButton.snp.top)
      make.leading.equalTo(self.todoTextField.snp.leading).dividedBy(0.2)
    }
  }
}

// MARK: EventAction

extension NewTodoViewController {
  func onEventAction() {
    todoTextField.rx.text.changed
      .map({
        guard let value = $0 else { return false }
        return value.characters.count > 0
      })
      .subscribe(onNext: {[weak self] in
        self?.okButton.isEnabled = $0
      })
      .addDisposableTo(dispose)
    
    okButton.rx.tap
      .map({ [weak self] in
        return self?.todoTextField.text
      })
      .subscribe(onNext: { [weak self] in
        if let value = $0 {
          self?.presenter.addNewTodo(title: value, date: "2017-04-10", state: "Completed")
        }
      })
      .addDisposableTo(dispose)
    
    cancelButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.dismissView()
      })
      .addDisposableTo(dispose)
  }
}

// MARK: - NewTodoViewDelegate

extension NewTodoViewController: NewTodoViewDelegate {
  func dismissView() {
    if let navigationController = navigationController {
      navigationController.popViewController(animated: true)
    }
  }
}
