import 'package:flutter/material.dart';
import 'package:play/play.dart';
import 'package:video_player_sample/views/play_package_github_example.dart';

void main() async {
  await playInitialize();

  runApp(const MaterialApp(
    home: MainPage(),
  ));
}
