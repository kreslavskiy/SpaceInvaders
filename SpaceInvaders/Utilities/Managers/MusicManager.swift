import AVFoundation

class MusicManager {
    static let shared = MusicManager()
    private var audioPlayer: AVAudioPlayer?

    private init() {
        if let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
        }
    }
    
    func playMusic() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.audioPlayer?.play()
        }
    }

    func stopMusic() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.audioPlayer?.stop()
        }
    }
    
    func toggleMusic(isPlaying: Bool) {
        if isPlaying {
            playMusic()
        } else {
            stopMusic()
        }
    }
}
