//
//  ArrayExtension.swift
//  bento_order
//
//  Created by tomoaki saito on 2015/06/15.
//  Copyright (c) 2015年 mikan. All rights reserved.
//

import Foundation

extension Array {
    func findAll(includeElement: T -> Bool) -> [(Int, T)] {
        let seq = zip(0..<self.count, self)
        return Swift.filter(seq) { includeElement($0.1) }
    }
    
    func find(includeElement: T -> Bool) -> Int? {
        return Swift.filter(enumerate(self)) { includeElement($0.1) }.first.map { $0.0 }
    }
}