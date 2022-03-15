import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/use_case/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:video/domain/entities/video_list_entity.dart';
import 'package:video/domain/repositories/video_repository.dart';

class GetListVideoUseCase extends UseCase<VideosListEntity, String> {
  final VideoRepository repository;

  const GetListVideoUseCase({required this.repository});

  @override
  Future<Either<FailureResponse, VideosListEntity>> call(String params) async {
    return await repository.videoList(params);
  }
}
