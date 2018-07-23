//
//  Template.swift
//  DVCS
//
//  Created by Joe Blau on 7/10/18.
//

import Foundation

public struct Template: Templating {
    public var key: String
    public var name: String
    public var fileName: String
    public var contents: String
    public var selected: Bool = false
}

extension Template: Codable {}

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
