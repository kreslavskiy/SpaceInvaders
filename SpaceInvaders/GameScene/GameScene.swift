import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate, ObservableObject {
    var spaceShip = SpaceShip()
    var spaceBackGround = Background(size: .zero)
    var score = 0
    var scoreLabel: Label!
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        size = view.bounds.size
        physicsWorld.gravity = CGVectorMake(0, -0.8)
        spaceBackGround = Background(size: CGSize(width: size.width * 2, height: size.height * 2))
        scoreLabel = Label(zPosition: 5, text: "Score: \(score)", numberOfLines: 3)
        scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height / 1.25)
        spaceShip.node?.position = CGPoint(x: size.width / 2, y: size.height / 9)
        
        addChild(scoreLabel)
        addChild(spaceBackGround.node!)
        addChild(spaceShip.node!)
        spaceShip.colorize()
        
        let asteroidCreate = SKAction.run {
            let asteroid = Asteroid.createAsteroid()
            self.addChild(asteroid)
        }
        
        Asteroid.spawn(scene: self, asteroidCreate:asteroidCreate)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scene?.isPaused = false
        self.scoreLabel.text = "Score: \(self.score)"
        self.scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height / 1.25)
        
        if let touch = touches.first {
            let touchLocation = CGPoint(x: touch.location(in: self).x, y: size.height / 9)
            spaceShip.move(touchLocation: touchLocation)
            spaceBackGround.move(touchLocation: touchLocation)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scene?.isPaused = false
        self.scoreLabel.text = "Score: \(self.score)"
        self.scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height / 1.25)
        
        if let touch = touches.first {
            let touchLocation = CGPoint(x: touch.location(in: self).x, y: size.height / 9)
            spaceShip.move(touchLocation: touchLocation)
            spaceBackGround.move(touchLocation: touchLocation)
        }
    }
    
    override func didSimulatePhysics() {
        enumerateChildNodes(withName: "asteroid") { (asteroid, stop) in
            if asteroid.position.y < -50 {
                asteroid.removeFromParent()
                self.score += 1
                self.scoreLabel.text = "Score: \(self.score)"
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        VibrationManager.triggerVibration()
        saveHighestScore()
        self.scoreLabel.text = "Game over\nScore: \(score)\nTap to restart"
        self.scoreLabel.position = CGPoint(x: frame.size.width / 2, y: size.height / 1.5)
        self.scene?.isPaused = true
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { t in
            self.score = 0
        }
        enumerateChildNodes(withName: "asteroid") { (asteroid, stop) in
            asteroid.removeFromParent()
        }
    }
    
    func saveHighestScore() {
        let currentHighScore = UserDefaults.standard.integer(forKey: "HighScore")
        if score > currentHighScore {
            UserDefaults.standard.set(score, forKey: "HighScore")
        }
    }
}
