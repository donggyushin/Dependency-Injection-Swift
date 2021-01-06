//
//  Restaurant.swift
//  DependencyInject
//
//  Created by 신동규 on 2021/01/06.
//


import Foundation

enum Cuisine: String, Decodable {
    case chineese = "Chineese"
    case pizza = "Pizza"
    case italian = "Italian"
    case mexican = "Mexican"
    case oriental = "Oriental"
}


struct Restaurant: Decodable {
    let name: String
    let cuisines: [Cuisine]
}
