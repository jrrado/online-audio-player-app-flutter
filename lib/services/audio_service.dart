import 'package:just_audio/just_audio.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AudioService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Play audio from Firebase Storage URL
  Future<void> playAudio(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  // Pause audio
  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  // Stop audio
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  // Seek to a specific position
  Future<void> seekAudio(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Get audio duration
  Future<Duration?> getAudioDuration(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      return _audioPlayer.duration;
    } catch (e) {
      print("Error getting audio duration: $e");
      return null;
    }
  }
}