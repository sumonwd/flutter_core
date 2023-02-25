import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? uuid, lastName;
  int? id;
  String firstName, email;
  UserModel({required this.firstName, required this.email, this.uuid, this.lastName, this.id});

  /// Connect the generated [_$UserModelFromJson] function to the `fromJson`
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
