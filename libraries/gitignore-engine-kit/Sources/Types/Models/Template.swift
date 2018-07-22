//
//  Template.swift
//  DVCS
//
//  Created by Joe Blau on 7/10/18.
//

import Foundation

public struct Template: Templating {
    var key: String
    var name: String
    var fileName: String
    var contents: String
    var selected: Bool = false
}


extension Template: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return """
        key: \(key)
        name: \(name)
        file name: \(fileName)
        contents: \(contents)
        """
    }

    public var debugDescription: String {
        return description
    }

}
