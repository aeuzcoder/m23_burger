import 'package:m23_burger/feature/domain/entity/food_entity.dart';

class FoodModel extends FoodEntity {
  const FoodModel({
    required super.name,
    required super.price,
    required super.isHave,
    required super.image,
    required super.weight,
    required super.time,
    required super.type,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'] as String,
      price: json['price'] as int,
      isHave: json['isHave'] as bool,
      image: json['image'] as String,
      weight: json['weight'] as double,
      time: json['time'] as int,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'isHave': isHave,
      'image': image,
      'weight': weight,
      'time': time,
      'type': type,
    };
  }
}
