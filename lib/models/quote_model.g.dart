// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseQuoteModel _$BaseQuoteModelFromJson(Map<String, dynamic> json) =>
    BaseQuoteModel(
      json['text'] as String?,
      json['tag'] as String?,
      json['author'] as String?,
    );

Map<String, dynamic> _$BaseQuoteModelToJson(BaseQuoteModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'tag': instance.tag,
      'author': instance.author,
    };

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      (json['status'] as num?)?.toInt(),
      json['message'] as String?,
      (json['count'] as num?)?.toInt(),
      quotes: (json['quotes'] as List<dynamic>?)
          ?.map((e) => BaseQuoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'count': instance.count,
      'quotes': instance.quotes,
    };
