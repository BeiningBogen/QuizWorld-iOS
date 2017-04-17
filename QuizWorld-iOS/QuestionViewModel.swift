//
//  QuestionViewModel.swift
//  QuizWorld-iOS
//
//  Created by Håkon Bogen on 16/04/2017.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import UIKit
import QuizWorld_API
import ReactiveSwift
import ReactiveCocoa
import Result

public protocol QuestionViewModelInputs {

    func viewDidLoad()

}

public protocol QuestionViewModelOutputs {

    var questionText: Signal<String, NoError> { get }

}

public protocol QuestionViewModelType {

    var inputs: QuestionViewModelInputs { get }
    var outputs: QuestionViewModelOutputs { get }
    
}

//class VM {
//    let name: Property<String>
//    let submit: Action<(), (), NoError>
//}
//
//class VC: UIViewController {
//    let viewModel: VM
//    let nameLabel: UILabel
//    let submitButton: UIButton
//
//    override func viewDidLoad() {
//        // Update nameLabel's text whenever the VM's name changes
//        nameLabel.reactive.text <~ vm.name
//
//        // Execute the submit action whenever the button is tapped
//        submitButton.reactive.pressed = CocoaAction(vm.submit)
//    }
//}

class QuestionViewModel: QuestionViewModelType, QuestionViewModelInputs, QuestionViewModelOutputs {
//    j
//    var text: Property<String>


    public let questionText: Signal<String, NoError>

    public var inputs: QuestionViewModelInputs { return self }
    public var outputs: QuestionViewModelOutputs { return self }

    /// Question that should be shown
    fileprivate var question = MutableProperty<Question?>(nil)

    public init() {

        let question = self.viewDidLoadProperty.signal.map {

            return AppEnviroment.current.fetchQuestion()
            
        }

        self.questionText = question.map { questions in
            
            questions.first()
            
            }.skipNil().map { q in

                return q.value!.text

        }

    }

    fileprivate let viewDidLoadProperty = MutableProperty()

    public func viewDidLoad() {
        self.viewDidLoadProperty.value = ()
    }
}
