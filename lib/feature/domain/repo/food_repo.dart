import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/feature/domain/entity/food_entity.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';

abstract class FoodRepo {
  Future<Either<Failure, List<FoodEntity>>> getFood();
  Future<Either<Failure, OrderStatus>> sendOrder({required OrderEntity order});
  Future<Stream<Either<Failure, List<OrderEntity>>>> watchOrder();
  Future<Either<Failure, void>> uptadeStatus(String id, OrderStatus status);
}
