class VideosListDTO {
  const VideosListDTO({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.videos,
    required this.pageInfo,
  });

  final String kind;
  final String etag;
  final String nextPageToken;
  final List<VideoItemDTO> videos;
  final PageInfoDTO pageInfo;

  factory VideosListDTO.fromJson(Map<String, dynamic> json) => VideosListDTO(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        videos: List<VideoItemDTO>.from(
            json["items"].map((x) => VideoItemDTO.fromJson(x))),
        pageInfo: PageInfoDTO.fromJson(json["pageInfo"]),
      );
}

class VideoItemDTO {
  const VideoItemDTO({
    required this.kind,
    required this.etag,
    required this.id,
    required this.video,
  });

  final String kind;
  final String etag;
  final String id;
  final VideoDTO video;

  factory VideoItemDTO.fromJson(Map<String, dynamic> json) => VideoItemDTO(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        video: VideoDTO.fromJson(json["snippet"]),
      );
}

class VideoDTO {
  const VideoDTO({
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
  final ThumbnailsDTO thumbnails;
  final String channelTitle;
  final String playlistId;
  final int position;
  final ResourceIdDTO resourceId;

  factory VideoDTO.fromJson(Map<String, dynamic> json) => VideoDTO(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: ThumbnailsDTO.fromJson(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        playlistId: json["playlistId"],
        position: json["position"],
        resourceId: ResourceIdDTO.fromJson(json["resourceId"]),
      );
}

class ResourceIdDTO {
  const ResourceIdDTO({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  factory ResourceIdDTO.fromJson(Map<String, dynamic> json) => ResourceIdDTO(
        kind: json["kind"],
        videoId: json["videoId"],
      );
}

class ThumbnailsDTO {
  const ThumbnailsDTO({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  final DefaultDTO thumbnailsDefault;
  final DefaultDTO medium;
  final DefaultDTO high;

  factory ThumbnailsDTO.fromJson(Map<String, dynamic> json) => ThumbnailsDTO(
        thumbnailsDefault: DefaultDTO.fromJson(json["default"]),
        medium: DefaultDTO.fromJson(json["medium"]),
        high: DefaultDTO.fromJson(json["high"]),
      );
}

class DefaultDTO {
  const DefaultDTO({
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final int width;
  final int height;

  factory DefaultDTO.fromJson(Map<String, dynamic> json) => DefaultDTO(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );
}

class PageInfoDTO {
  const PageInfoDTO({
    required this.totalResults,
    required this.resultsPerPage,
  });

  final int totalResults;
  final int resultsPerPage;

  factory PageInfoDTO.fromJson(Map<String, dynamic> json) => PageInfoDTO(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );
}
