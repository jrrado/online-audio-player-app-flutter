import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart'; // Import your AuthService
import 'screens/signup_screen.dart'; // Import your SignUpScreen
import 'screens/login_screen.dart'; // Import your LoginScreen
import 'screens/home_screen.dart'; // Import your HomeScreen
import 'screens/profile_screen.dart'; // Import your ProfileScreen
import 'screens/player_screen.dart'; // Import your PlayerScreen
import 'screens/create_playlist_screen.dart'; // Import your CreatePlaylistScreen
import 'screens/search_screen.dart'; // Import your SearchScreen
import 'screens/offline_library_screen.dart'; // Import your OfflineLibraryScreen
import 'screens/admin_dashboard_screen.dart'; // Import your AdminDashboardScreen

import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Notification received: ${message.notification?.title}");
  });
  runApp(MyApp());

  // Initialize Background Audio Service
  // final audioService = BackgroundAudioService();
  // await audioService.initAudioService();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Streaming App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(), // Default route (LoginScreen)
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/player': (context) => PlayerScreen(audioUrl: ''), // Pass audioUrl dynamically
        '/createPlaylist': (context) => CreatePlaylistScreen(),
        '/search': (context) => SearchScreen(),
        // '/offlineLibrary': (context) => OfflineLibraryScreen(),
        '/adminDashboard': (context) => AdminDashboardScreen(),
      },
    );
  }
}
