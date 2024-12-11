import Foundation
import SpriteKit

class SpaceShip: GameObject {
    init() {
        super.init(node: SKSpriteNode(imageNamed: "Ship"), position: CGPoint(x: 0, y: -250))
        
        self.node?.xScale = 3
        self.node?.yScale = 2
        self.node?.zPosition = 2
        
        self.node?.physicsBody = SKPhysicsBody(texture: (self.node?.texture!)!, size: self.node!.size)
        self.node?.physicsBody?.isDynamic = false
        
        self.node?.physicsBody?.categoryBitMask = 0x1 << 0
        self.node?.physicsBody?.collisionBitMask = 0x1 << 1
        self.node?.physicsBody?.contactTestBitMask = 0x1 << 1
    }
    
    func colorize () {
        let colorAction1 = SKAction.colorize(with: .yellow, colorBlendFactor: 1, duration: 1)
        let colorAction2 = SKAction.colorize(with: .blue, colorBlendFactor: 0, duration: 1)
        let colorSequenceAnimation = SKAction.sequence([colorAction1, colorAction2])
        let colorActionRepeat = SKAction.repeatForever(colorSequenceAnimation)
        
        self.node?.run(colorActionRepeat)
    }
}
