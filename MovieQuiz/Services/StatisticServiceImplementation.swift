import Foundation

final class StatisticServiceImplementation: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    // MARK: - Public Properties
    var gamesCount: Int {
        get { storage.integer(forKey: StatisticStorageKeys.gamesCount.rawValue) }
        set { storage.set(newValue, forKey: StatisticStorageKeys.gamesCount.rawValue) }
    }
    
    var bestGame: QuizResult {
        get {
            let correct = storage.integer(forKey: StatisticStorageKeys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: StatisticStorageKeys.bestGameTotal.rawValue)
            let date = storage.object(forKey: StatisticStorageKeys.bestGameDate.rawValue) as? Date ?? Date()
            return QuizResult(correct: correct, total: total, date: date)
        }
        
        set {
            storage.set(newValue.correct, forKey: StatisticStorageKeys.bestGameCorrect.rawValue)
            storage.set(newValue.total, forKey: StatisticStorageKeys.bestGameTotal.rawValue)
            storage.set(newValue.date, forKey: StatisticStorageKeys.bestGameDate.rawValue) }
    }
    
    var totalAccuracy: Double {
        let correct = storage.integer(forKey: StatisticStorageKeys.correctAnswers.rawValue)
        let total = storage.integer(forKey: StatisticStorageKeys.questionAmount.rawValue)
        return total == 0 ? 0 : Double(correct) / Double(total) * 100
    }
    
    // MARK: - Public Methods
    func storeResult(correct count: Int, total amount: Int) {
        gamesCount += 1
        
        let currentCorrect = storage.integer(forKey: StatisticStorageKeys.correctAnswers.rawValue)
        let currentTotal = storage.integer(forKey: StatisticStorageKeys.questionAmount.rawValue)
        
        storage.set(currentCorrect + count, forKey: StatisticStorageKeys.correctAnswers.rawValue)
        storage.set(currentTotal + amount, forKey: StatisticStorageKeys.questionAmount.rawValue)
        
        let newGame = QuizResult(correct: count, total: amount, date: Date())
        if newGame.isBetterThan(bestGame) {
            bestGame = newGame
        }
    }
}
