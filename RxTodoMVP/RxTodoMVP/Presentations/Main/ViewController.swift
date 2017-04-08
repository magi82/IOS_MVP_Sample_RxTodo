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

final class ViewController: BaseViewController {

  // MARK: Properties

  var presenter: MainPresenterDelegate
  var displayTodoList: [String] = []
  
  // MARK: UI Properties
  
  lazy var tableView: UITableView = UITableView().then { [weak self] in
    guard let `self` = self else { return }
    
    $0.dataSource = self
    $0.delegate = self
    $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
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
    
    view.addSubview(tableView)
    
    presenter.attachView(self)
    presenter.configure()
  }
  
  override func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalTo(0)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// MARK: - MainViewDelegate

extension ViewController: MainViewDelegate {
  
  func setTodoList(_ todoList: [String]) {
    displayTodoList = todoList
    
    tableView.reloadData()
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
    
    cell.textLabel?.text = displayTodoList[indexPath.row]
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return displayTodoList.count
  }
}
