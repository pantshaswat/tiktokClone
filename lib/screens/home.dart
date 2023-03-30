import 'package:clone/components/textButton.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late VideoPlayerController controller;
  bool isVideoPause = false;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/bik.mp4')
      ..initialize().then((_) {
        setState(() {});
        controller.play();
      });

    controller.setLooping(true);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void playPause() {
    setState(() {
      isVideoPause = !isVideoPause;
      controller.value.isPlaying ? controller.pause() : controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            color: Colors.black,
          ),
          GestureDetector(
            onTap: playPause,
            child: Center(
              child: controller.value.isInitialized
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller)),
                    )
                  : Container(),
            ),
          ),
          isVideoPause
              ? Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: IconButton(
                        onPressed: playPause,
                        icon: Icon(
                          Icons.play_arrow,
                          color: Color.fromARGB(255, 199, 191, 191),
                          size: 80,
                        )),
                  ),
                )
              : Container(),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.live_tv,
                    color: Colors.white,
                  )),
              Spacer(),
              textButton(() {}, "Following", false),
              textButton(() {}, "Friends", false),
              textButton(() {}, "For You", true),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
