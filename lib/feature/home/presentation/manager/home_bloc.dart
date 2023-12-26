import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/use_cases/get_data_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoinUseCase coinUseCase = CoinUseCase();
  bool showPagingLoading = true;
  List<CoinEntity> data = [];

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      final currentState = getCurrentHomeLoadedPageState();
      if (event is GetData) {
        if (event.page == 0) {
          emit(HomeLoading());
        }
        if (event.page != 0) {
          showPagingLoading = true;
        }
        final result = await coinUseCase.getData(event.page);
        emit(result.fold(
          (l) => HomeError(error: l),
          (r) {
            data.addAll(r);
            return HomeLoaded(data: data, showPagingLoading: showPagingLoading);
          },
        ));
      } else if (event is GetFavoriteCoins) {
        emit(HomeLoading());
        final result = await coinUseCase.LoadFavoriteCoins();
        emit(result.fold(
          (l) => HomeError(error: l),
          (r) {
            return HomeLoaded(data: r, showPagingLoading: showPagingLoading);
          },
        ));
      } else if (event is AddFavoriteCoins) {
        final result = await coinUseCase.saveFavoriteCoin(event.id);
        result.fold(
          (l) => print('false'),
          (r) {
            print(true);
          },
        );
      } else if (event is showMessageEvent) {
        emit(
          currentState!.setSate(
            message: 'Data is available on your keyboard',
          ),
        );
      }
    });
  }

  HomeLoaded? getCurrentHomeLoadedPageState() {
    final currentState =
        super.state is HomeLoaded ? super.state as HomeLoaded : null;
    return currentState;
  }
}
