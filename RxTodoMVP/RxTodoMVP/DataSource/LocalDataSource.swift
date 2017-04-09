//
//  LoalDataSource.swift
//  RxTodoMVP
//
//  Created by ByungKook Hwang on 2017. 4. 9..
//  Copyright © 2017년 magi82. All rights reserved.
//

import Foundation

final class LocalDataSource {

  // Mock Data
  static private var list: [TodoModel] = [
    TodoModel(title: "study", date: "2016-06-08", state: "completed"),
    TodoModel(title: "coffee", date: "2016-10-27", state: "completed"),
    TodoModel(title: "운동", date: "2017-01-03", state: "completed"),
    TodoModel(title: "공부", date: "2017-02-18", state: "completed"),
    TodoModel(title: "walk", date: "2017-04-09", state: "completed")
  ]
  
  static func getList() -> [TodoModel] {
    return list
  }
}
