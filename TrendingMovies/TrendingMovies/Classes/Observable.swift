//
//  Observable.swift
//  TrendingMovies
//
//  Created by Şevval Alev on 8.05.2023.
//

import Foundation
//this class can contains every kind of method String,Int,dictionary,class
class Observable<T> {
//The "Observable" class can be used to monitor/control a mutable value.
    var value: T?{
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind( _ listener: @escaping ((T?) -> Void)) {
        //Called automatically when the "value" property of the "Observable" class changes
        listener(value) //listener update the value
        self.listener = listener 
    }
}
