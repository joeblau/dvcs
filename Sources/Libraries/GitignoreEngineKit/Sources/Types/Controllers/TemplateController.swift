//
//  TemplateController.swift
//  DVCS
//
//  Created by Joe Blau on 12/17/16.
//
//

import Foundation

public struct TemplateController { //}: ReadOnlyTemplateManagerProtocol {
    public var order = Order()
    public var templates = Templates()
    fileprivate var count = 0

    /// Create Template Controller
    ///
    /// - Returns: Template Controller
    public init(dataDirectory: URL, orderFile: URL) {
        do {
            order = try parseFile(orderFile: orderFile)
            templates = try parseTemplateDirectory(dataDirectory: dataDirectory)
            try templates.patchTemplates(dataDirectory: dataDirectory)
            try templates.stackTempaltes(dataDirectory: dataDirectory)
            count = templates.count
        } catch {
            print("‼️ You might not have done a recursive clone to update your submodules:\n‼️ `git submodule update --init --recursive`")
        }
    }

    // MARK: - Private

    /// Parse file which defines template order precedence
    ///
    /// - Parameter orderFile: The dependency order file
    /// - Returns: Order of templates in order precedence
    fileprivate func parseFile(orderFile: URL) throws -> Order {
        return try String(contentsOf: orderFile, encoding: String.Encoding.utf8)
            .replacingOccurrences(of: "\r\n", with: "\n", options: .regularExpression)
            .components(separatedBy: "\n")
            .map({ (line) -> String in
                line.trimmingCharacters(in: .whitespaces).lowercased()
            })
            .filter({ (line) -> Bool in
                !line.hasPrefix("#") && !line.isEmpty
            })
            .enumerated()
            .reduce(into: Order(), { (order: inout Order, line: (offset: Int, element: String)) in
                order[line.element] = line.offset
            })
    }

    /// Parse template directory
    ///
    /// - Parameter dataDirectory: The path to the data directory
    /// - Returns: Ignore template model dictionary
    fileprivate func parseTemplateDirectory(dataDirectory: URL) throws -> Templates {
        return try FileManager().enumerator(at: dataDirectory, includingPropertiesForKeys: nil)!
            .allObjects
            .compactMap({ (templatePath: Any) -> URL? in
                templatePath as? URL
            })
            .filter({ (templatePath: URL) -> Bool in
                templatePath.pathExtension == TemplateSuffix.template.extension
            })
            .compactMap({ (templatePath: URL) -> Template in
                let fileContents = try String(contentsOf: templatePath,
                                              encoding: String.Encoding.utf8)
                    .replacingOccurrences(of: "\r\n",
                                          with: "\n",
                                          options: .regularExpression)
                return Template(key: templatePath.name.lowercased(),
                    name: templatePath.name,
                    fileName: templatePath.fileName,
                    contents: TemplateSuffix.template.header(name: templatePath.name).appending(fileContents),
                    selected: false)
            })
            .reduce(into: Templates(), { (templates: inout Templates, template: Template) in
                templates[template.key] = template
            })
    }
}
