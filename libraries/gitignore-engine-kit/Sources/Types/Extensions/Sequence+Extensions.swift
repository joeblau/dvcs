//
//  Sequence+Extensions.swift
//  DVCS
//
//  Created by Joe Blau on 1/29/17.
//
//

import Foundation

internal extension Sequence where Iterator.Element: Hashable {
    var uniqueElements: [Iterator.Element] {
        return Array( Set(self) )
    }
}
