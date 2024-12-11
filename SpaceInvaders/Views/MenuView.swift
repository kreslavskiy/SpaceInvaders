import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Back")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Text("SPACE \nINVADERS")
                        .font(.custom("PixelPowerline", size: 50))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: GameView()) {
                        ZStack {
                            Image("button")
                                .resizable()
                                .frame(width: 220, height: 140)
                            
                            Text("PLAY")
                                .font(.custom("PixelPowerline", size: 40))
                                .foregroundStyle(.white)
                                .offset(y: 23)
                        }
                    }
                    .onAppear {
                        VibrationManager.triggerVibration()
                    }
                    
                    NavigationLink(destination: AwardsView()) {
                        ZStack {
                            Image("button")
                                .resizable()
                                .frame(width: 220, height: 140)
                            
                            Text("Awards")
                                .font(.custom("PixelPowerline", size: 30))
                                .foregroundStyle(.white)
                                .offset(y: 23)
                        }
                    }
                    .onAppear {
                        VibrationManager.triggerVibration()
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        ZStack {
                            Image("button")
                                .resizable()
                                .frame(width: 220, height: 140)
                            
                            Text("Settings")
                                .font(.custom("PixelPowerline", size: 30))
                                .foregroundStyle(.white)
                                .offset(y: 23)
                        }
                    }
                    .onAppear {
                        VibrationManager.triggerVibration()
                    }
                    Spacer()
                }
            }
            .onAppear {
                if UserDefaults.standard.object(forKey: "isMusicEnabled") == nil {
                    UserDefaults.standard.set(true, forKey: "isMusicEnabled")
                }
                
                if UserDefaults.standard.object(forKey: "isVibrationEnabled") == nil {
                    UserDefaults.standard.set(true, forKey: "isVibrationEnabled")
                }
                
                if UserDefaults.standard.bool(forKey: "isMusicEnabled") {
                    MusicManager.shared.playMusic()
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
