import 'package:dependencies/dartz/dartz.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:video/domain/entities/video_list_entity.dart';

abstract class VideoRepository {
  const VideoRepository();

  Future<Either<FailureResponse, VideosListEntity>> videoList(String playlistId);
}
