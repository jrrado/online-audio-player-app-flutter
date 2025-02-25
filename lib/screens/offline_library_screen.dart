// import 'package:flutter/material.dart';
// import '../services/offline_service.dart';
//
// class OfflineLibraryScreen extends StatelessWidget {
//   final OfflineService _offlineService = OfflineService();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Offline Library')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await _offlineService.downloadSong('url', 'song.mp3');
//           },
//           child: Text('Download Song'),
//         ),
//       ),
//     );
//   }
// }