import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePagePlayer(),
  ));
}

class HomePagePlayer extends StatelessWidget {
  const HomePagePlayer({Key? key}) : super(key: key);

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

class Player extends StatefulWidget {
  final String url;
  const Player({Key? key, required this.url}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    initializePlayer(widget.url);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  void initializePlayer(String url) async {
    final fileInfo = await DefaultCacheManager().getFileFromCache(url);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(url)..setLooping(true);
      _controller!.initialize().then((value) async {
        await DefaultCacheManager().getSingleFile(url).then((value) {
          print('Added to cache $url');
        });
        setState(() {
          _controller!.play();
        });
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file)..setLooping(true);
      _controller!.initialize().then((value) {
        setState(() {
          _controller!.play();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_controller != null)
        ? Column(
            children: [
              ((_controller!.value.initialized)
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : const CircularProgressIndicator()),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller!.value.isPlaying) {
                      _controller!.pause();
                    } else {
                      _controller!.play();
                    }
                  });
                },
                child: Icon(
                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          )
        : Text("Loading..");
  }
}

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
