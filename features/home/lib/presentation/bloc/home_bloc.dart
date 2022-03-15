import 'package:common/utils/error/failure_response.dart';
import 'package:common/utils/state/view_data_state.dart';
import 'package:core/method_channel/flutter_method_channel.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:home/presentation/bloc/bloc.dart';
import 'package:video/domain/entities/video_list_entity.dart';
import 'package:video/domain/usecases/get_list_video_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListVideoUseCase getListVideoUseCase;
  final FlutterMethodChannel flutterMethodChannel;

  HomeBloc({
    required this.getListVideoUseCase,
    required this.flutterMethodChannel,
  }) : super(HomeState(statusYouTubeVideo: ViewData.initial())) {
    on<GetListVideo>(
      (event, emit) async {
        emit(
          state.copyWith(
            statusYouTubeVideo: ViewData.loading(message: 'Loading'),
          ),
        );
        final String playlistId = await flutterMethodChannel.getPlaylistId();
        final response = await getListVideoUseCase.call(playlistId);

        response.fold(
          (FailureResponse failure) => emit(
            state.copyWith(
              statusYouTubeVideo: ViewData.error(
                message: failure.errorMessage,
                failure: failure,
              ),
            ),
          ),
          (VideosListEntity? data) => emit(
            state.copyWith(
              statusYouTubeVideo: ViewData.loaded(data: data),
            ),
          ),
        );
      },
    );
  }
}
