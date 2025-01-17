import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';
import 'package:m23_burger/feature/domain/repo/food_repo.dart';

class UptadeStatus {
  FoodRepo foodRepo;
  UptadeStatus({required this.foodRepo});
  Future<Either<Failure, void>> uptadeStatus(
      String id, OrderStatus status) async {
    return foodRepo.uptadeStatus(id, status);
  }
}
