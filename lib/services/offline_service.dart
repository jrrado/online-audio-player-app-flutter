// import 'package:downloads_path_provider/downloads_path_provider.dart';
// import 'dart:io';
//
// class OfflineService {
//   // Download song for offline playback
//   Future<void> downloadSong(String url, String fileName) async {
//     final directory = await DownloadsPathProvider.downloadsDirectory;
//     final file = File('${directory?.path}/$fileName');
//     final request = await HttpClient().getUrl(Uri.parse(url));
//     final response = await request.close();
//     await response.pipe(file.openWrite());
//   }
// }