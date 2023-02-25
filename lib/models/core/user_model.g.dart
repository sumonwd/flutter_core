// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      firstName: json['firstName'] as String,
      email: json['email'] as String,
      uuid: json['uuid'] as String?,
      lastName: json['lastName'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'lastName': instance.lastName,
      'id': instance.id,
      'firstName': instance.firstName,
      'email': instance.email,
    };
