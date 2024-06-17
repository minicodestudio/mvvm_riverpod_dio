import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_riverpod_dio/core/models/base_model.dart';
part 'quote_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BaseQuoteModel {
  
  String? text;
  String? tag;
  String? author;
  
  factory BaseQuoteModel.fromJson(Map<String, dynamic> json) {
    return _$BaseQuoteModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseQuoteModelToJson(this);

  BaseQuoteModel(this.text, this.tag, this.author);
}

@JsonSerializable()
class QuoteModel extends BaseModel {
  List<BaseQuoteModel>? quotes;

  QuoteModel(super.status, super.message, super.count, {this.quotes});

  factory QuoteModel.fromJson(Map<String, dynamic> json) => _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() {
    return _$QuoteModelToJson(this);
  }
}
