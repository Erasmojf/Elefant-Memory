//
//  Array+Only.swift
//  Elefant-Memory
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
