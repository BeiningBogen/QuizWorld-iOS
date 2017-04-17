//
//  AppEnviroment.swift
//  QuizWorld-iOS
//
//  Created by Håkon Bogen on 16/04/2017.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import UIKit
import QuizWorld_API

public struct AppEnviroment {

    public static var current: Enviroment!

    public static func start() {

        self.current = Enviroment(apiService: Service(serverConfig: ServerConfig.local as! ServerConfig), questions: [Question]())

    }
}
