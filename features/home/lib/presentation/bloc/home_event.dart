import 'package:dependencies/equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchVideo extends HomeEvent {
  const SearchVideo();

  @override
  List<Object?> get props => [];
}
