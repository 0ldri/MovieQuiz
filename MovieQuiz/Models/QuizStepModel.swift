import UIKit

struct QuizStepModel {
    let image: UIImage
    let question: String
    let questionNumber: String
    
    static func convert(model: QuizQuestion, currentQuestionIndex: Int, totalQuestion: Int) -> QuizStepModel {
      return QuizStepModel(
            image: UIImage(named: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(totalQuestion)"
        )
    }
}
