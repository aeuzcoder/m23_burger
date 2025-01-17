import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/feature/domain/entity/food_entity.dart';
import 'package:m23_burger/feature/domain/repo/food_repo.dart';

class GetFood {
  final FoodRepo foodRepo;
  const GetFood({required this.foodRepo});

  Future<Either<Failure, List<FoodEntity>>> call() async {
    return await foodRepo.getFood();
  }
}
