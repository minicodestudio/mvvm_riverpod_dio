import 'package:mvvm_riverpod_dio/services/QuoteService.dart';
import 'package:riverpod/riverpod.dart';

final quoteProvider = FutureProvider.autoDispose((_) {
  final quoteService = QuoteService.instance;
  return quoteService.getQuotes();
});