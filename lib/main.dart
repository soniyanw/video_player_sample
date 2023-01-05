import 'package:flutter/material.dart';
import 'package:play/play.dart';
import 'package:video_player/video_player.dart';

void main() {
  dothis();
  runApp(const MaterialApp(
    home: Home(),
  ));
}

void dothis() async {
  await playInitialize();
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoController(isAutoStart: true);

    _videoController.mobilePlayer = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..setLooping(true);

    _videoController.mobilePlayer.initialize().then((value) async {
      setState(() {
        _videoController.play();
      });
    });
  }

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
              child: _videoController.mobilePlayer.value.isInitialized
                  ? Video(
                      videoData: VideoData.network(
                          url:
                              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
                      builder: (BuildContext context,
                          Widget child,
                          Video video,
                          VideoState videoState,
                          VideoController videoController) {
                        _videoController.play();
                        if (_videoController.mobilePlayer.value.isInitialized) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Center(
                                  child: AspectRatio(
                                    aspectRatio:
                                        videoState.videoController.aspectRatio,
                                    child: child,
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            videoState.videoController.pause();
                                          },
                                          child: const RotatedBox(
                                            quarterTurns: 2,
                                            child: Icon(
                                              Icons.skip_next,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            videoState.videoController
                                                .playOrPause();
                                          },
                                          child: Icon(
                                            Icons.pause,
                                            color: Colors.white,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            videoState.videoController.pause();
                                          },
                                          child: const Icon(
                                            Icons.skip_next,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Expanded(
                                          child: StreamBuilder(
                                            stream: videoState.videoController
                                                .streamDurationPosition(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              return Slider(
                                                min: 0,
                                                max: videoState.videoController
                                                    .getDurationMax()
                                                    .inMilliseconds
                                                    .toDouble(),
                                                value: videoState
                                                    .videoController
                                                    .getDurationPosition()
                                                    .inMilliseconds
                                                    .toDouble(),
                                                onChanged: (double value) {
                                                  setState(() {
                                                    videoState.videoController
                                                        .seek(Duration(
                                                            milliseconds:
                                                                value.toInt()));
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.fullscreen,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  : Container(
                      color: Colors.pink,
                    ))),
    );
  }
}
