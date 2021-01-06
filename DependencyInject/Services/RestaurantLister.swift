//
//  RestaurantLister.swift
//  DependencyInject
//
//  Created by 신동규 on 2021/01/06.
//

import Foundation

class RestaurantLister {
    
    static let shared = RestaurantLister()
    
    func get(onCompletion: @escaping ([Restaurant]) -> ()) {
        
        let decoder = JSONDecoder()
        
        guard let file = Bundle.main.url(forResource: "restaurants", withExtension: "json"),
            let data = try? Data(contentsOf: file),
            let restaurants = try? decoder.decode([Restaurant].self, from: data) else {
                onCompletion([])
                return
        }
        
        let randomDelay = Double.random(in: 0..<5)
        Timer.scheduledTimer(
            withTimeInterval: randomDelay,
            repeats: false,
            block: { _ in onCompletion(restaurants) })
    }
}
