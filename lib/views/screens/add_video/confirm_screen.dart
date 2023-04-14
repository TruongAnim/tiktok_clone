import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/widgets/input_text_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});
  final File videoFile;
  final String videoPath;

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.file(widget.videoFile);
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setVolume(1);
    videoPlayerController.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: VideoPlayer(videoPlayerController),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(15),
                child: InputTextField(
                  label: 'Song',
                  icon: Icons.music_note,
                  controller: songController,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: InputTextField(
                  label: 'Caption',
                  icon: Icons.closed_caption,
                  controller: captionController,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Share now'),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}