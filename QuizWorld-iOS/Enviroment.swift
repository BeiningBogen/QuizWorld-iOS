//
//  Enviroment.swift
//  QuizWorld
//
//  Created by Håkon Bogen on 29/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import QuizWorld_API
import ReactiveSwift

public struct Enviroment {
    
    public let apiService: ServiceType
    
    public let questions: [Question]
    
    public init(apiService: ServiceType = Service(serverConfig: ServerConfig.local as! ServerConfig), questions: [Question] = [Question]()) {
        
        self.apiService = apiService
        self.questions = questions
        
    }
    
    
    public func fetchQuestion() -> SignalProducer<Question, ErrorEnvelope> {
        
        return SignalProducer<Question, ErrorEnvelope>(value: questions.first!)

    }
    
}
