import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m23_burger/core/error/exception.dart';
import 'package:m23_burger/feature/data/model/food_model.dart';
import 'package:m23_burger/feature/data/model/order_model.dart';
import 'package:m23_burger/feature/domain/entity/order_entity.dart';

abstract class RemoteDataSource {
  Future<List<FoodModel>> getFood();
  Future<OrderStatus> sendOrder(OrderModel order);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore firestore;

  const RemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<FoodModel>> getFood() async {
    try {
      final querySnapshot = await firestore.collection('foods').get();
      return querySnapshot.docs
          .map((doc) => FoodModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<OrderStatus> sendOrder(OrderModel order) async {
    try {
      final orderRef = await firestore.collection('orders').add(order.toJson());

      final completer = Completer<OrderStatus>();
      final timer = Timer(const Duration(minutes: 5), () {
        if (!completer.isCompleted) {
          completer.complete(OrderStatus.rejected);
        }
      });

      final subscription =
          firestore.collection('orders').doc(orderRef.id).snapshots().listen(
        (snapshot) {
          if (snapshot.exists) {
            final data = snapshot.data() as Map<String, dynamic>;
            final status = OrderModel.stringToStatus(data['status'] as String);

            if (!completer.isCompleted &&
                (status == OrderStatus.accepted ||
                    status == OrderStatus.rejected)) {
              completer.complete(status);
            }
          }
        },
      );

      final result = await completer.future;
      timer.cancel();
      await subscription.cancel();
      return result;
    } catch (e) {
      throw ServerException();
    }
  }
}
