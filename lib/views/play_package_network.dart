import 'package:flutter/material.dart';
import 'package:play/play.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New"),
      ),
      body: Center(
          child: Container(
        width: double.infinity,
        color: Colors.black,
        child: Video(
          videoData: VideoData.network(
              url:
                  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
          builder: (BuildContext context, Widget child, Video video,
              VideoState videoState, VideoController videoController) {
            videoController = VideoController(isAutoStart: true);
            videoController.play();
            return Container(
              height: 400,
            );
          },
        ),
      )),
    );
  }
}
