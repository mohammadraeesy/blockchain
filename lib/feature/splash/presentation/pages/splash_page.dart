import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uni_project/feature/home/presentation/pages/home_page.dart';
import 'package:uni_project/feature/splash/presentation/manager/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final SplashCubit _splashCubit = SplashCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer(
          bloc: _splashCubit..loadSplashData(),
          listener: (context, state) async {
            if (state is SplashLoaded) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
          },
          builder: (context, state) {
            return _loadingBody();
          },
        ),
      ),
    );
  }

  Widget _loadingBody() {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/logo.jpg',
            height: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 100,
          ),
          const SpinKitSpinningLines(
            color: Colors.yellow,
            size: 60.0,
          ),
        ],
      ),
    );
  }
}
