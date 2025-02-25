import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add song metadata
  Future<void> addSong(Map<String, dynamic> songData) async {
    await _firestore.collection('songs').add(songData);
  }

  // Fetch all songs
  Future<List<Map<String, dynamic>>> fetchSongs() async {
    QuerySnapshot snapshot = await _firestore.collection('songs').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // Fetch user playlists
  Future<List<Map<String, dynamic>>> fetchPlaylists(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('playlists').where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  // Add song to playlist
  Future<void> addSongToPlaylist(String playlistId, String songId) async {
    await _firestore.collection('playlists').doc(playlistId).update({
      'songs': FieldValue.arrayUnion([songId]),
    });
  }
}