import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';
import 'package:m23_burger/feature/domain/repo/food_repo.dart';

class SendOrder {
  final FoodRepo foodRepo;
  const SendOrder({required this.foodRepo});
  Future<Either<Failure, OrderStatus>> call(OrderEntity order) async {
    return await foodRepo.sendOrder(order: order);
  }
}
