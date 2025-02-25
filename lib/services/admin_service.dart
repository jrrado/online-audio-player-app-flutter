import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload new song
  Future<void> uploadSong(Map<String, dynamic> songData) async {
    await _firestore.collection('songs').add(songData);
  }

  // View user activity
  Future<List<Map<String, dynamic>>> fetchUserActivity() async {
    QuerySnapshot snapshot = await _firestore.collection('userActivity').get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}