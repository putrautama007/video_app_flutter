import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:core/method_channel/flutter_method_channel.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:video/domain/entities/youtube_video_entity.dart';
import 'package:video/domain/usecases/get_video_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetVideoUseCase getVideoUseCase;
  final FlutterMethodChannel flutterMethodChannel;

  HomeBloc({
    required this.getVideoUseCase,
    required this.flutterMethodChannel,
  }) : super(HomeState(statusYouTubeVideo: ViewData.initial()));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SearchVideo) {
      yield* _searchVideo();
    }
  }

  Stream<HomeState> _searchVideo() async* {
    yield state.copyWith(
        statusYouTubeVideo: ViewData.loading(message: 'Loading'));

    final String searchQuery = await flutterMethodChannel.searchVideo();
    final response = await getVideoUseCase.call(searchQuery);

    yield* response.fold(_onFailure, _onSuccess);
  }

  Stream<HomeState> _onFailure(FailureResponse failure) async* {
    yield state.copyWith(
        statusYouTubeVideo: ViewData.error(
      message: failure.errorMessage,
      failure: failure,
    ));
  }

  Stream<HomeState> _onSuccess(
    YouTubeVideoEntity? data,
  ) async* {
    final videos = data?.items ?? [];
    if (videos.isEmpty) {
      yield state.copyWith(
        statusYouTubeVideo: ViewData.noData(message: 'No Data'),
      );
    } else {
      yield state.copyWith(statusYouTubeVideo: ViewData.loaded(data: data));
    }
  }
}
