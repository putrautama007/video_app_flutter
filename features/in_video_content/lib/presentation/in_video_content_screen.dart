import 'package:dependencies/youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video/domain/entities/video_list_entity.dart';

class InVideoContentScreen extends StatefulWidget {
  final VideoItemEntity videoItemEntity;

  const InVideoContentScreen({required this.videoItemEntity, Key? key})
      : super(key: key);

  @override
  State<InVideoContentScreen> createState() => _InVideoContentScreenState();
}

class _InVideoContentScreenState extends State<InVideoContentScreen> {
  late YoutubePlayerController _controller;
  late bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItemEntity.video.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoItemEntity.video.title),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
    );
  }
}
