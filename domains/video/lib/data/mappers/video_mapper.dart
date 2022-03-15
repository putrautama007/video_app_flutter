import 'package:video/data/models/video_list_dto.dart';
import 'package:video/domain/entities/video_list_entity.dart';

class VideoMapper {
  const VideoMapper();

  VideosListEntity mapVideosListDTOtoEntity(VideosListDTO? dto) {
    final videos = <VideoItemEntity>[];
    for (VideoItemDTO i in dto?.videos ?? []) {
      videos.add(mapVideoItemDTOtoEntity(i));
    }
    return VideosListEntity(
      pageInfo: mapPageInfoDTOtoEntity(dto?.pageInfo),
      nextPageToken: dto?.nextPageToken ?? '',
      etag: dto?.etag ?? '',
      videos: videos,
      kind: dto?.kind ?? '',
    );
  }

  VideoItemEntity mapVideoItemDTOtoEntity(VideoItemDTO? dto) => VideoItemEntity(
        id: dto?.id ?? '',
        kind: dto?.kind ?? '',
        video: mapVideoDTOtoEntity(dto?.video),
        etag: dto?.kind ?? '',
      );

  VideoEntity mapVideoDTOtoEntity(VideoDTO? dto) => VideoEntity(
        thumbnails: mapThumbnailsDTOtoEntity(dto?.thumbnails),
        playlistId: dto?.playlistId ?? '',
        title: dto?.title ?? '',
        publishedAt: dto?.publishedAt ?? DateTime.now(),
        resourceId: mapResourceIdDTOtoEntity(dto?.resourceId),
        description: dto?.description ?? '',
        channelId: dto?.channelId ?? '',
        channelTitle: dto?.channelTitle ?? '',
        position: dto?.position ?? 0,
      );

  ResourceIdEntity mapResourceIdDTOtoEntity(ResourceIdDTO? dto) =>
      ResourceIdEntity(
        kind: dto?.kind ?? "",
        videoId: dto?.videoId ?? "",
      );

  ThumbnailsEntity mapThumbnailsDTOtoEntity(ThumbnailsDTO? dto) =>
      ThumbnailsEntity(
        medium: mapDefaultDTOtoEntity(dto?.medium),
        thumbnailsDefault: mapDefaultDTOtoEntity(dto?.thumbnailsDefault),
        high: mapDefaultDTOtoEntity(dto?.high),
      );

  DefaultEntity mapDefaultDTOtoEntity(DefaultDTO? dto) => DefaultEntity(
        width: dto?.width ?? 0,
        url: dto?.url ?? "",
        height: dto?.height ?? 0,
      );

  PageInfoEntity mapPageInfoDTOtoEntity(PageInfoDTO? dto) => PageInfoEntity(
        totalResults: dto?.totalResults ?? 0,
        resultsPerPage: dto?.resultsPerPage ?? 0,
      );
}
