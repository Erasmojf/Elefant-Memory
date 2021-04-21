//
//  Array+Identifiable.swift
//  Elefant-Memory
//
//  Created by Erasmo J.F Da Silva on 21/04/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index  in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
