import UIKit

class VibrationManager {
   static func triggerVibration() {
        if let isVibrationEnabled = UserDefaults.standard.value(forKey: "isVibrationEnabled") as? Bool, isVibrationEnabled {
            let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
            feedbackGenerator.impactOccurred()
        }
    }
}
