import SwiftUI

struct AwardsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var highScore = UserDefaults.standard.integer(forKey: "HighScore")
    var body: some View {
        ZStack {
            Image("Back")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("AWARDS")
                    .font(.custom("PixelPowerline", size: 50))
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                
                Text("Gain more scores to get awards!")
                    .font(.custom("PixelPowerline", size: 25))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                
                VStack {
                    
                    HStack {
                        Image("award1")
                            .scaleEffect(0.6)
                            .opacity(highScore >= 20 ? 1 : 0.4)
                        
                        Image("award2")
                            .scaleEffect(0.6)
                            .opacity(highScore >= 40 ? 1 : 0.4)
                        
                        Image("award3")
                            .scaleEffect(0.6)
                            .opacity(highScore >= 60 ? 1 : 0.4)
                    }
                    
                    HStack {
                        Image("award4")
                            .scaleEffect(0.6)
                            .opacity(highScore >= 80 ? 1 : 0.4)
                        
                        Image("award5")
                            .scaleEffect(0.6)
                            .padding(.trailing, 20)
                            .opacity(highScore >= 100 ? 1 : 0.4)
                        
                        Image("award6")
                            .scaleEffect(0.8)
                            .opacity(highScore >= 120 ? 1 : 0.4)
                    }
                    
                }
                
                Button(action: {
                    dismiss()
                    
                }) {
                    ZStack {
                        Image("button")
                            .resizable()
                            .frame(width: 150, height: 100)
                        
                        Text("BACK")
                            .font(.custom("PixelPowerline", size: 30))
                            .foregroundStyle(.white)
                            .offset(y: 17)
                    }
                    
                }
                .onAppear {
                    VibrationManager.triggerVibration()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AwardsView()
}
