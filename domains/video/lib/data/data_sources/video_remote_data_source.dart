import 'package:dependencies/dio/dio.dart';
import 'package:video/data/models/video_list_dto.dart';
import 'package:resources/constant/api_constant.dart';

abstract class VideoRemoteDataSource {
  const VideoRemoteDataSource();

  Future<VideosListDTO> videoList(String playlistId);
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final Dio dio;

  const VideoRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<VideosListDTO> videoList(String playlistId) async {
    try {
      final params = {
        'part': 'snippet',
        'maxResults': '10',
        'playlistId': playlistId,
        'access_token': ApiConstant.apiKey,
        'key': ApiConstant.apiKey,
      };

      final response = await dio.get(
        'playlistItems',
        queryParameters: params,
      );
      return VideosListDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
