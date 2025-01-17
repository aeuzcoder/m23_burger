import 'package:m23_burger/feature/domain/entity/order_entity.dart';
import 'package:m23_burger/feature/domain/entity/user_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.user,
    required super.food,
    required super.id,
    required super.status,
    super.rejectionReason,
    super.estimatedTime,
  });
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      status: entity.status,
      rejectionReason: entity.rejectionReason,
      estimatedTime: entity.estimatedTime,
      user: entity.user,
      food: entity.food,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      status: OrderModel.stringToStatus(json['status'] as String),
      rejectionReason: json['rejectionReason'] as String?,
      estimatedTime: json['estimatedTime'] as int?,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      food: Map<String, int>.from(json['food'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': OrderModel.statusToString(status),
      'rejectionReason': rejectionReason,
      'estimatedTime': estimatedTime,
      'user': user.toJson(),
      'food': food,
    };
  }

  static String statusToString(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.accepted:
        return 'accepted';
      case OrderStatus.rejected:
        return 'rejected';
      case OrderStatus.completed:
        return 'completed';
    }
  }

  static OrderStatus stringToStatus(String status) {
    switch (status) {
      case 'accepted':
        return OrderStatus.accepted;
      case 'rejected':
        return OrderStatus.rejected;
      case 'completed':
        return OrderStatus.completed;
      default:
        return OrderStatus.pending;
    }
  }
}
