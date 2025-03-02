import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'login_screen.dart'; // Import your login screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize video player
    _controller = VideoPlayerController.asset("assets/images/logo_screen.mp4")
      ..initialize().then((_) {
        setState(() {}); // Refresh UI when video is ready
        _controller.play(); // Play video
      });

    // Navigate to Login Screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose video controller when screen is closed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for smooth transition
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio:
                    _controller.value.aspectRatio, // Maintain aspect ratio
                child: VideoPlayer(_controller), // Show video
              )
            : const CircularProgressIndicator(
                color: Colors.white), // Show loader if video is not ready
      ),
    );
  }
}
