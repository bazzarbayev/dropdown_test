import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(defaultValue: '')
  final String value;

  @JsonKey(defaultValue: '')
  final String id;

  @JsonKey(defaultValue: '')
  final String countryId;

  StateModel({
    required this.value,
    required this.id,
    required this.countryId,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
