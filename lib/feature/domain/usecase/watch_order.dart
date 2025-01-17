import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';
import 'package:m23_burger/feature/domain/repo/food_repo.dart';

class WatchOrder {
  FoodRepo foodRepo;
  WatchOrder({required this.foodRepo});
  Future<Stream<Either<Failure, List<OrderEntity>>>> call() async {
    return await foodRepo.watchOrder();
  }
}
