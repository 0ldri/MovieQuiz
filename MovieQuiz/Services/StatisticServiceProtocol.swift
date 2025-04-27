protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: QuizResult { get }
    var totalAccuracy: Double { get }
    
    func storeResult(correct count: Int, total amount: Int)
}

