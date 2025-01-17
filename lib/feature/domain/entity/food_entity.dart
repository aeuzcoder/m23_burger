import 'package:equatable/equatable.dart';

class FoodEntity extends Equatable {
  final String name;
  final int price;
  final bool isHave;
  final String image;
  final double weight;
  final int time;
  final String type;

  const FoodEntity({
    required this.name,
    required this.price,
    required this.isHave,
    required this.image,
    required this.weight,
    required this.time,
    required this.type,
  });

  @override
  List<Object?> get props => [
        name,
        price,
        isHave,
        image,
        weight,
        time,
      ];
}
