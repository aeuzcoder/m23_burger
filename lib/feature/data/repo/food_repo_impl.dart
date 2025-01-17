import 'package:dartz/dartz.dart';
import 'package:m23_burger/core/error/exception.dart';
import 'package:m23_burger/core/error/failure.dart';
import 'package:m23_burger/core/platform/network_info.dart';
import 'package:m23_burger/feature/data/datasource/remote_data_source.dart';
import 'package:m23_burger/feature/data/model/order_model.dart';
import 'package:m23_burger/feature/domain/entity/food_entity.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';
import 'package:m23_burger/feature/domain/repo/food_repo.dart';

class FoodRepoImpl implements FoodRepo {
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;

  FoodRepoImpl({required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<FoodEntity>>> getFood() async {
    try {
      final remoteFood = await remoteDataSource.getFood();
      return Right(remoteFood);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderStatus>> sendOrder(
      {required OrderEntity order}) async {
    try {
      final orderModel = OrderModel.fromEntity(order);
      final OrderStatus status = await remoteDataSource.sendOrder(orderModel);
      return Right(status);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> uptadeStatus(String id, OrderStatus status) {
    // TODO: implement uptadeStatus
    throw UnimplementedError();
  }

  @override
  Future<Stream<Either<Failure, List<OrderEntity>>>> watchOrder() {
    // TODO: implement watchOrder
    throw UnimplementedError();
  }
}
