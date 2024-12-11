import Foundation
import SpriteKit

class GameObject {
    var node: SKSpriteNode?
    init (node: SKSpriteNode, position: CGPoint) {
        self.node = node
        self.node?.position = position
    }
    
    func move (touchLocation: CGPoint) {
        let moveAction = SKAction.move(to: touchLocation, duration: 0.05)
        self.node?.run(moveAction)
    }
}
