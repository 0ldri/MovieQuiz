import UIKit

struct QuizStepModel {
    let image: UIImage
    let question: String
    let questionNumber: String
    
    static func convert(model: QuizQuestion, currentQuestionIndex: Int, totalQuestion: Int) -> QuizStepModel {
        QuizStepModel(
            image: UIImage(data: model.image) ?? UIImage(),
            question: model.text,
            questionNumber: "\(currentQuestionIndex + 1)/\(totalQuestion)"
        )
    }
}
