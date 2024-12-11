import SwiftUI
import SpriteKit

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var scene: SKScene {
        let scene = GameScene()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let screenSize = windowScene.screen.bounds.size
            scene.size = screenSize
        }
        scene.scaleMode = .aspectFill
        
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .statusBar(hidden: true)
            
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                        
                    }) {
                        Image("backButton")
                            .resizable()
                            .frame(width: 80, height: 80)
                        
                    }
                    .padding()
                    .onAppear {
                        VibrationManager.triggerVibration()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameView()
}
