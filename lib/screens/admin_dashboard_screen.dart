import 'package:flutter/material.dart';
import '../services/admin_service.dart';

class AdminDashboardScreen extends StatelessWidget {
  final AdminService _adminService = AdminService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _adminService.uploadSong({
              'title': 'New Song',
              'artist': 'Artist',
              'url': 'song_url',
            });
          },
          child: Text('Upload Song'),
        ),
      ),
    );
  }
}