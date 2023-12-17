part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetData extends HomeEvent {
  final int page;

  GetData(this.page);
}
