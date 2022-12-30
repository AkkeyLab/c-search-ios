//
//  File.swift
//  
//
//  Created by AkkeyLab on 2022/12/30.
//

public protocol Appliable {}

public extension Appliable {
    @discardableResult
    func apply(closure: (_ this: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
