import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create playlist
  Future<void> createPlaylist(String userId, String name) async {
    await _firestore.collection('playlists').add({
      'userId': userId,
      'name': name,
      'songs': [],
    });
  }

  // Add song to favorites
  Future<void> addToFavorites(String userId, String songId) async {
    await _firestore.collection('users').doc(userId).update({
      'favorites': FieldValue.arrayUnion([songId]),
    });
  }
}

