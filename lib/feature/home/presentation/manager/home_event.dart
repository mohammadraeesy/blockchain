part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetData extends HomeEvent {
  final int page;

  GetData(this.page);
}

class GetFavoriteCoins extends HomeEvent {}

class AddFavoriteCoins extends HomeEvent {
  final String id;

  AddFavoriteCoins({required this.id});
}
