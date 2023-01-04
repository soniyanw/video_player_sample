import 'package:flutter/material.dart';
import 'package:kraken/kraken.dart';
import 'package:kraken_video_player/kraken_video_player.dart';

void main() {
  KrakenVideoPlayer.initialize();
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: Wrap(
          children: <Widget>[
            MyHomepage(),
          ],
        ));
  }
}

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Kraken(
      bundle: KrakenBundle.fromUrl(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
  }
}
