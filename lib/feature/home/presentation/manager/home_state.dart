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
  final String? message;

  HomeLoaded({
    this.data,
    this.showPagingLoading,
    this.message,
  });

  HomeLoaded setSate({
    List<CoinEntity>? data,
    bool? showPagingLoading,
    String? message,
  }) {
    return HomeLoaded(
      message: message,
      data: data ?? this.data,
      showPagingLoading: showPagingLoading ?? this.showPagingLoading,
    );
  }
}
