import 'package:flutter/material.dart';
import 'package:video_player_sample/views/video_player_playpage.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                width: MediaQuery.of(context).size.height / 1.2,
                height: MediaQuery.of(context).size.height / 1.2,
                child: Player(
                  url:
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                ))));
  }
}
