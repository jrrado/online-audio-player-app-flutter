import 'package:flutter/material.dart';
import '../services/audio_service.dart';

class PlayerScreen extends StatefulWidget {
  final String audioUrl;

  PlayerScreen({required this.audioUrl});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final AudioService _audioService = AudioService();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioService.playAudio(widget.audioUrl);
    _isPlaying = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Playing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  if (_isPlaying) {
                    _audioService.pauseAudio();
                  } else {
                    _audioService.playAudio(widget.audioUrl);
                  }
                  _isPlaying = !_isPlaying;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}