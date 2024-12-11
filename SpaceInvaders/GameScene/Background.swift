import Foundation
import SpriteKit

class Background: GameObject {
    init (size: CGSize) {
        super.init(node: SKSpriteNode(imageNamed: "Back"),
                   position: CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2))
        self.node?.size = size
    }
    
    override func move(touchLocation: CGPoint) {
        guard let node = self.node else { return }
        let deltaX = (touchLocation.x - node.position.x) * 0.0005
        let newX = node.position.x + deltaX
        
        node.position = CGPoint(x: newX, y: node.position.y)
    }
}
