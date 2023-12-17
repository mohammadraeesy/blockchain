import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/presentation/manager/home_bloc.dart';
import 'package:uni_project/feature/home/presentation/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeBloc _homeBloc = HomeBloc();
  int page = 0;
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(),
          title: const Text(
            'CryptoMoon',
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc..add(GetData(page)),
          listener: (context, state) async {},
          builder: (context, state) {
            if (state is HomeLoaded) {
              isLoading = state.showPagingLoading ?? true;
              return _body(
                state.data ?? [],
              );
            } else {
              return _loadingWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _body(
    List<CoinEntity> data,
  ) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (isLoading &&
            scrollInfo is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {
          page = page + 1;
          isLoading = false;
          _homeBloc.add(GetData(page));
        }
        return false;
      },
      child: ListView(
        controller: _scrollController,
        children: [
          ListView.builder(
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final value = data[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        homeEntity: value,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _showLabel(value.image ?? ''),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            value.name ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Price : ${value.currentPrice ?? ''} USD',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Price Change : ${value.priceChange24h?.toStringAsFixed(8) ?? ''}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (isLoading)
            Container(
              width: 25,
              height: 25,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _showLabel(String url) {
    var a = url.lastIndexOf('svg');
    if (a == -1) {
      return CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
          url,
        ),
      );
    } else {
      return Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: SvgPicture.network(
          url,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Widget _loadingWidget() => SingleChildScrollView(
        child: SkeletonLoader(
          builder: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(),
            ),
            height: 64,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: 180,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 12,
                      width: 140,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ),
          items: 8,
          period: const Duration(seconds: 2),
          highlightColor: Colors.yellow.shade300,
          direction: SkeletonDirection.ltr,
        ),
      );
}
