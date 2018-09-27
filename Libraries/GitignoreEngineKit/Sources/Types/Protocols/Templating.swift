//
//  IgnoreTemplateModeling.swift
//  DVCS
//
//  Created by Joe Blau on 1/29/17.
//
//

internal protocol Templating {
    var key: String { get set }
    var name: String { get set }
    var fileName: String { get set }
    var contents: String { get set }
}
