import Foundation

struct QuizResult {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: QuizResult) -> Bool {
        correct > another.correct
    }
}

