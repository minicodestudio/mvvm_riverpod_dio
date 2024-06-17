import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  int? status;
  String? message;
  int? count;
  
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

  BaseModel(this.status, this.message, this.count);
}