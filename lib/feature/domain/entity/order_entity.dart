import 'package:m23_burger/feature/domain/entity/user_entity.dart';

enum OrderStatus { pending, accepted, rejected, completed }

class OrderEntity {
  final String id;
  final OrderStatus status;
  final String? rejectionReason;
  final int? estimatedTime;
  final UserEntity user;
  final Map<String, int> food;

  OrderEntity({
    required this.user,
    required this.food,
    required this.id,
    required this.status,
    this.rejectionReason,
    this.estimatedTime,
  });
}
