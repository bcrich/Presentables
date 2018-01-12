//
//  Presentable.swift
//  Presentables
//
//  Created by Ondrej Rafaj on 24/07/2017.
//  Copyright © 2017 manGoweb UK Ltd. All rights reserved.
//

import Foundation
import UIKit


public typealias TypedPresentableHeader = Any
public typealias TypedPresentableFooter = Any
public typealias TypedPresentableCell = Any


open class Presentable<T> {
    
    public typealias ConfigureClosure = (T) -> Void
    public typealias SelectedClosure = () -> Void
    
    public typealias PresentableItem = T
    public var configure: ConfigureClosure?
    
    open var identifier: String {
        return String(describing: T.self)
    }
    
    public var reusableType: T.Type {
        return T.self
    }
    
    var selected: SelectedClosure?
    
}


open class PresentableCell<T>: Presentable<T> {
    
    @discardableResult public func cellSelected(_ selected: @escaping SelectedClosure) -> Self {
        self.selected = selected
        return self
    }
    
    public static func create(_ configure: ConfigureClosure? = nil) -> PresentableCell<T> {
        let presentable = PresentableCell<T>()
        presentable.configure = configure
        return presentable
    }
    
    public override init() { }
    
}


open class PresentableHeader<T>: Presentable<T> {
    
    public static func create(_ configure: ConfigureClosure? = nil) -> PresentableHeader<T> {
        let presentable = PresentableHeader<T>()
        presentable.configure = configure
        return presentable
    }
    
    public override init() { }
    
}


open class PresentableFooter<T>: Presentable<T> {
    
    public static func create(_ configure: ConfigureClosure? = nil) -> PresentableFooter<T> {
        let presentable = PresentableFooter<T>()
        presentable.configure = configure
        return presentable
    }
    
    public override init() { }
    
}

