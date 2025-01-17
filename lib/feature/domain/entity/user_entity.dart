class UserEntity {
  final String name;
  final int number;
  final String location;
  final bool payment;

  UserEntity({
    required this.name,
    required this.number,
    required this.location,
    required this.payment,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'] as String,
      number: json['number'] as int,
      location: json['location'] as String,
      payment: json['payment'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'number': number,
      'location': location,
      'payment': payment,
    };
  }
}
