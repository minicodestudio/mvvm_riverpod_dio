import 'package:dio/dio.dart';
import 'package:mvvm_riverpod_dio/core/constants/api_constants.dart';
import 'package:mvvm_riverpod_dio/models/quote_model.dart';

class QuoteService {
  QuoteService._();
  static final instance = QuoteService._();

  final url = ApiConstants.BASE_URL + ApiConstants.PATH_RANDOM_3;

  Future<QuoteModel> getQuotes() async {
    final response = await Dio().get(url);
    print(response.data);
    return QuoteModel.fromJson(response.data);
  }

}