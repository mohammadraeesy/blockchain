import 'package:dartz/dartz.dart';
import 'package:uni_project/feature/home/data/data_sources/remote_data_source.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/repositories/home_rrepository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSourceImpl homeRemoteDataSourceImpl = HomeRemoteDataSourceImpl();

  @override
  Future<Either<String, List<CoinEntity>>> getData(int page) async{
    try {
      var response = await homeRemoteDataSourceImpl.getData(page);
      return Right(response);
    } on FormatException catch (e) {
      return Left(e.message);
    }
  }
}