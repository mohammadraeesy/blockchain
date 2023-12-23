import 'package:dartz/dartz.dart';
import 'package:uni_project/feature/home/data/data_sources/remote_data_source.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/repositories/home_rrepository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl =
      HomeRemoteDataSourceImpl();

  @override
  Future<Either<String, List<CoinEntity>>> getData(int page) async {
    try {
      var response = await homeRemoteDataSourceImpl.getData(page);
      return Right(response);
    } on FormatException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<CoinEntity>>> loadFavoriteCoinIds() async {
    try {
      List<CoinEntity> response = await homeRemoteDataSourceImpl.getData(0);
      List<String> ids = await homeRemoteDataSourceImpl.loadFavoriteCoins();
      final result =
          response.where((element) {
            return ids.contains(element.id);
          }).toList();
      return Right(result);
    } catch (e) {
      return Left('Error');
    }
  }

  @override
  Future<Either<String, bool>> saveFavoriteCoin(String id) async{
    try {
      List<String> ids = await homeRemoteDataSourceImpl.loadFavoriteCoins();

      if (ids.contains(id))
        return Right(true);

      return Right(await homeRemoteDataSourceImpl.saveFavoriteCoins([id,...ids]));
    } catch (e) {
      return Left('Error');
    }
  }
}
