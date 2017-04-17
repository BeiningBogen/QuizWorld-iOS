//
//  ViewController.swift
//  QuizWorld-iOS
//
//  Created by Håkon Bogen on 16/04/2017.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import UIKit

import ReactiveSwift
import ReactiveCocoa
import ReactiveExtensions
import Prelude
import ReactiveSwift
import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet public weak var questionText: UILabel!

    fileprivate let viewModel: QuestionViewModelType = QuestionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.questionText.reactive.text <~ self.viewModel.outputs.questionText

    }

}

