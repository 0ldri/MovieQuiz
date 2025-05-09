import UIKit

final class AlertPresenter {
    weak var delegate: AlertPresenterDelegate?
 
    func showAlert (model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert)
        
        alert.view.accessibilityIdentifier = "GameResultAlert"
        
        let action = UIAlertAction(title: model.buttonText, style: .default) { _ in model.completion()
        }
        
        alert.addAction(action)
        delegate?.present(alert: alert)
    }
    }
   
