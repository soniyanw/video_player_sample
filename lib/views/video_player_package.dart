import 'package:flutter/material.dart';
import 'package:video_player_sample/views/video_player_videoscreen.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VideoScreen()));
            },
            child: Text("Play Video"),
          ),
        ),
      ),
    );
  }
}
