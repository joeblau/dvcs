//
//  Server.swift
//  DVCS
//
//  Created by Joe Blau on 12/22/16.
//
//

import Vapor
import GitignoreEngineKit

internal class Gitignore {
    fileprivate let config = Config.default()
    fileprivate var services =  Services.default()
    fileprivate var middlewares = MiddlewareConfig()

    public func app(_ env: Environment) throws -> Application {
        try configure(env: env)
        let app = try Application(config: config, environment: env, services: services)

        return app
    }

    private func configure(env: Environment) throws {
        let router = EngineRouter.default()
        try routes(router, env: env)

        services.register(router, as: Router.self)

        middlewares.use(FileMiddleware.self)
        middlewares.use(ErrorMiddleware.self)
        services.register(middlewares)
    }

    /// Register your application's routes here.
    private func routes(_ router: Router, env: Environment) throws {
        let dataDirectory = URL(fileURLWithPath: DirectoryConfig.detect().workDir, isDirectory: true)
            .absoluteURL.appendingPathComponent("Data", isDirectory: true)
            .absoluteURL.appendingPathComponent("gitignore", isDirectory: true)
            .absoluteURL.appendingPathComponent("templates", isDirectory: true)
        let orderFile = dataDirectory.absoluteURL.appendingPathComponent("order", isDirectory: false)

        let templateController = TemplateController(dataDirectory: dataDirectory, orderFile: orderFile)

        let apiHandlers = APIHandlers(templateController: templateController)
        apiHandlers.createIgnoreEndpoint(router: router)
        apiHandlers.createTemplateDownloadEndpoint(router: router)
        apiHandlers.createListEndpoint(router: router)
        apiHandlers.createOrderEndpoint(router: router)
        apiHandlers.createHelp(router: router)
    }
}
