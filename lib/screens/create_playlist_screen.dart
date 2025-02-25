import 'package:flutter/material.dart';
import '../services/playlist_service.dart';

class CreatePlaylistScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final PlaylistService _playlistService = PlaylistService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Playlist')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Playlist Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _playlistService.createPlaylist('userId', _nameController.text);
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}