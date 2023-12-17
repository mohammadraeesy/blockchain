import 'package:dartz/dartz.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';

abstract class HomeRepository{
  Future<Either<String, List<CoinEntity>>> getData(int page);
}