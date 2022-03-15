import 'package:dependencies/equatable/equatable.dart';

class VideosListEntity extends Equatable {
  const VideosListEntity({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.videos,
    required this.pageInfo,
  });

  final String kind;
  final String etag;
  final String nextPageToken;
  final List<VideoItemEntity> videos;
  final PageInfoEntity pageInfo;

  @override
  List<Object?> get props => [
        kind,
        etag,
        nextPageToken,
        videos,
        pageInfo,
      ];
}

class VideoItemEntity extends Equatable {
  const VideoItemEntity({
    required this.kind,
    required this.etag,
    required this.id,
    required this.video,
  });

  final String kind;
  final String etag;
  final String id;
  final VideoEntity video;

  @override
  List<Object?> get props => [
        kind,
        etag,
        id,
        video,
      ];
}

class VideoEntity extends Equatable {
  const VideoEntity({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
  });

  final DateTime publishedAt;
  final String channelId;
  final String title;
  final String description;
  final ThumbnailsEntity thumbnails;
  final String channelTitle;
  final String playlistId;
  final int position;
  final ResourceIdEntity resourceId;

  @override
  List<Object?> get props => [
        publishedAt,
        channelId,
        title,
        description,
        thumbnails,
        channelTitle,
        playlistId,
        position,
        resourceId,
      ];
}

class ResourceIdEntity extends Equatable {
  const ResourceIdEntity({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  @override
  List<Object?> get props => [
        kind,
        videoId,
      ];
}

class ThumbnailsEntity extends Equatable {
  const ThumbnailsEntity({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  final DefaultEntity thumbnailsDefault;
  final DefaultEntity medium;
  final DefaultEntity high;

  @override
  List<Object?> get props => [
        thumbnailsDefault,
        medium,
        high,
      ];
}

class DefaultEntity extends Equatable {
  const DefaultEntity({
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final int width;
  final int height;

  @override
  List<Object?> get props => [
        url,
        width,
        height,
      ];
}

class PageInfoEntity extends Equatable {
  const PageInfoEntity({
    required this.totalResults,
    required this.resultsPerPage,
  });

  final int totalResults;
  final int resultsPerPage;

  @override
  List<Object?> get props => [
        totalResults,
        resultsPerPage,
      ];
}
