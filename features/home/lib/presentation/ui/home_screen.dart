import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:video/domain/entities/video_list_entity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Video'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.statusYouTubeVideo.status;
            if (status.isLoading) {
              return const CircularProgressIndicator();
            } else if (status.isError) {
              return Text(state.statusYouTubeVideo.message);
            } else if (status.isNoData) {
              return const Text('No Data');
            } else if (status.isHasData) {
              return ListView.builder(
                  itemCount: state.statusYouTubeVideo.data?.videos.length ?? 0,
                  itemBuilder: (context, index) {
                    VideoItemEntity videoItemEntity =
                        state.statusYouTubeVideo.data!.videos[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: videoItemEntity
                                    .video.thumbnails.thumbnailsDefault.url),
                            const SizedBox(width: 20),
                            Flexible(
                              child: Text(
                                videoItemEntity.video.title,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
