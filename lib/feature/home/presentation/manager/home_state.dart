part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String? error;

  HomeError({
    this.error,
  });
}

class HomeLoaded extends HomeState {
  final List<CoinEntity>? data;
  final bool? showPagingLoading;

  HomeLoaded({
    this.data,
    this.showPagingLoading,
  });
}
