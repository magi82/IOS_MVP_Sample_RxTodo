//
//  ViewController.swift
//  RxTodoMVP
//
//  Created by Byung Kook Hwang on 2017. 4. 6..
//  Copyright © 2017년 magi82. All rights reserved.
//

import UIKit

import Then
import SnapKit
import RxSwift
import RxCocoa

final class ViewController: BaseViewController {

  // MARK: Properties

  var presenter: MainPresenterDelegate
  var displayTodoList: [DisplayViewModel] = []
  
  // MARK: UI Properties
  
  lazy var tableView: UITableView = UITableView().then { [weak self] in
    guard let `self` = self else { return }
    
    $0.dataSource = self
    $0.delegate = self
    $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
  
  // MARK: Initializing
  
  init(presenter: MainPresenterDelegate) {
    self.presenter = presenter
    
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: ViewController Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter.configure(self)
    
    navigationItem.rightBarButtonItem = addButtonItem
    view.addSubview(tableView)
    
    onEventAction()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    presenter.getList()
  }
  
  override func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(0)
    }
  }
}

// MARK: - MainViewDelegate

extension ViewController: MainViewDelegate {
  
  func setTodoList(_ todoList: [DisplayViewModel]) {
    displayTodoList = todoList
    
    tableView.reloadData()
  }
}

// MARK: EventAction

extension ViewController {
  
  func onEventAction() {
    addButtonItem.rx.tap
      .subscribe(onNext: { [weak self] in
        guard let `self` = self else { return }
        
        let newTodoPresenter = InjectorUtils.getInstance().provideNewTodoPresenter()
        let newTodoViewController = NewTodoViewController(presenter: newTodoPresenter)
        self.navigationController?.pushViewController(newTodoViewController, animated: true)
      })
      .addDisposableTo(dispose)
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(displayTodoList[indexPath.row])
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
    
    cell.textLabel?.text = displayTodoList[indexPath.row].title
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayTodoList.count
  }
}
