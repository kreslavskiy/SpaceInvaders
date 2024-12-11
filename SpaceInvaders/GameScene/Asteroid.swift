import Foundation
import SpriteKit

class Asteroid: GameObject {
    var randX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
    
    init (size: CGSize, name: String, zPosition: CGFloat) {
        super.init(node: SKSpriteNode(imageNamed: "Asteroid2"), position: CGPoint(x: randX, y: UIScreen.main.bounds.height + 60))
        
        self.node?.size = size
        self.node?.name = name
        self.node?.zPosition = zPosition
        
        self.node?.physicsBody = SKPhysicsBody(texture: (self.node?.texture!)!, size: (self.node?.size)!)
        
        self.node?.physicsBody?.categoryBitMask = 0x1 << 1
        self.node?.physicsBody?.collisionBitMask = 0x1 << 0 | 0x1 << 1
        self.node?.physicsBody?.contactTestBitMask = 0x1 << 0
        
        self.node?.physicsBody?.angularVelocity = CGFloat.random(in: -1...2) * 3
    }
    
    static func createAsteroid () -> SKSpriteNode {
        let size = CGFloat.random(in: 25.0 ... 100.0)
        let asteroidSize = CGSize(width: size, height: size)
        return Asteroid(size: asteroidSize, name: "asteroid", zPosition: 2).node!
    }
    
    static func spawn (scene: SKScene, asteroidCreate: SKAction) {
        let asteroidCreationDelay = SKAction.wait(forDuration: 1.2, withRange: 0.5)
        let asteroidSequenceAction = SKAction.sequence([asteroidCreate, asteroidCreationDelay])
        let asteroidRunAction = SKAction.repeatForever(asteroidSequenceAction)
        scene.run(asteroidRunAction)
    }
}
