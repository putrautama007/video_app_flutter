import 'package:dependencies/equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetListVideo extends HomeEvent {
  const GetListVideo();

  @override
  List<Object?> get props => [];
}
