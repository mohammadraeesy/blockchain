

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/use_cases/get_data_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ResetPasswordUseCase resetPasswordUseCase = ResetPasswordUseCase();
  bool showPagingLoading = true;
  List<CoinEntity> data = [];


  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetData) {
        if (event.page == 0) {
          emit(HomeLoading());
        }
        if (event.page != 0) {
          showPagingLoading = true;
        }
        final result = await resetPasswordUseCase.call(event.page);
        emit(result.fold(
          (l) => HomeError(error: l),
          (r) {
            data.addAll(r);
            return HomeLoaded(data: data, showPagingLoading: showPagingLoading);
          },
        ));
      }
    });
  }
}
