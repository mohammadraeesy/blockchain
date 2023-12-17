import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  void loadSplashData() async{
    await Future.delayed(const Duration(seconds: 5));
    emit(SplashLoaded());
  }
}
