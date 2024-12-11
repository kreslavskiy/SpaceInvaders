import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @AppStorage("isVibrationEnabled") private var isVibrationEnabled = true
    @AppStorage("isMusicEnabled") private var isMusicEnabled = true
    
    var body: some View {
        ZStack {
            Image("Back")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Text("SETTINGS")
                    .font(.custom("PixelPowerline", size: 50))
                    .foregroundStyle(.white)
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("Music")
                            .font(.custom("PixelPowerline", size: 40))
                            .foregroundStyle(.white)
                            .padding()
                        
                        Button(action: {
                            isMusicEnabled.toggle()
                            
                            MusicManager.shared.toggleMusic(isPlaying: isMusicEnabled)
                        }) {
                            ZStack {
                                Image("button2")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Text(isMusicEnabled ? "ON" : "OFF")
                                    .font(.custom("PixelPowerline", size: 30))
                                    .foregroundStyle(isMusicEnabled ? .green : .red)
                            }
                        }
                        .padding()
                    }
                    
                    HStack {
                        Text("VIBRATION")
                            .font(.custom("PixelPowerline", size: 40))
                            .foregroundStyle(.white)
                            .padding()
                        
                        Button(action: {
                            isVibrationEnabled.toggle()
                            
                            UserDefaults.standard.set(isVibrationEnabled, forKey: "isVibrationEnabled")
                            
                            if isVibrationEnabled {
                                VibrationManager.triggerVibration()
                            }
                        }) {
                            ZStack {
                                Image("button2")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                
                                Text(isVibrationEnabled ? "ON" : "OFF")
                                    .font(.custom("PixelPowerline", size: 30))
                                    .foregroundStyle(isVibrationEnabled ? .green : .red)
                            }
                        }
                        .padding()
                    }

                }
                
                Spacer()
                
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
    SettingsView()
}
