import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart'; // Import Chewie package
import 'package:goldfinder/home%20page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController; // Chewie controller
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // Set device orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // Initialize the video player controller
    _videoPlayerController = VideoPlayerController.asset("assets/video3.mp4")
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            // Start playing after initialization
            _videoPlayerController.play();

            // Initialize Chewie controller after the video is initialized
            _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              aspectRatio: 9 / 20, // Adjust aspect ratio based on your video
              autoPlay: true, // Auto-play the video
              looping: true, // Loop the video
              showControls: false, // Hide controls for the splash screen
            );
            _isVideoInitialized = true;
          });
        }
      });

    // Navigate to the home page after a delay
    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => GoldApp()),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose controllers properly
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            if (_isVideoInitialized && _chewieController != null)
              Chewie(controller: _chewieController!), // Display Chewie player
            if (!_isVideoInitialized)
              const Center(
                child:
                    CircularProgressIndicator(), // Show loader until video is initialized
              ),
          ],
        ),
      ),
    );
  }
}
