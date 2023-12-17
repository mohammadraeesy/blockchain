import 'package:dartz/dartz.dart';
import 'package:uni_project/feature/home/data/repositories/home_repository_impl.dart';
import 'package:uni_project/feature/home/domain/entities/home_entity.dart';
import 'package:uni_project/feature/home/domain/repositories/home_rrepository.dart';


class ResetPasswordUseCase {
  final HomeRepository repository = HomeRepositoryImpl();

  Future<Either<String, List<CoinEntity>>> call(int page) async {
    return await repository.getData(page);
  }
}