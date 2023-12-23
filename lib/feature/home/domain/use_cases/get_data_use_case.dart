import 'package:dartz/dartz.dart';
import 'package:uni_project/feature/home/data/repositories/home_repository_impl.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/repositories/home_rrepository.dart';


class CoinUseCase {
  final HomeRepository repository = HomeRepositoryImpl();

  Future<Either<String, List<CoinEntity>>> getData(int page) async {
    return await repository.getData(page);
  }

  Future<Either<String, bool>> saveFavoriteCoin(String id) async {
    return await repository.saveFavoriteCoin(id);
  }

  Future<Either<String, List<CoinEntity>>> LoadFavoriteCoins() async {
    return await repository.loadFavoriteCoinIds();
  }
}