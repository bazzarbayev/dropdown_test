// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      value: json['value'] as String? ?? '',
      id: json['id'] as String? ?? '',
      countryId: json['countryId'] as String? ?? '',
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'id': instance.id,
      'countryId': instance.countryId,
    };
