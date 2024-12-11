import Foundation
import SpriteKit

class Label: SKLabelNode {
    init (zPosition: CGFloat, text: String, position: CGPoint = CGPoint(x: 0, y: -50), numberOfLines: Int = 1, fontSize: CGFloat = 45, fontName: String = "PixelPowerline") {
        super.init()
        self.zPosition = zPosition
        self.text = text
        self.position = position
        self.numberOfLines = numberOfLines
        self.fontSize = fontSize
        self.fontName = fontName
    }
    
    func show () {
        self.zPosition = 5
    }
    
    func hide () {
        self.zPosition = -1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
