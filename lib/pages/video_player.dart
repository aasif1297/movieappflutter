import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final YoutubePlayerController controller;
  VideoPlayerPage({Key key, @required this.controller}) : super(key: key);
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState(controller);
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final YoutubePlayerController controller;
  _VideoPlayerPageState(this.controller);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(controller: controller),
          ),
          Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                  icon: Icon(
                    EvaIcons.closeCircle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }))
        ],
      ),
    );
  }
}
