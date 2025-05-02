import 'dart:convert';
import 'package:assignment/presentation/utils/constant.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchNews(int page);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchNews(int page) async {
    /// api url point
    final url = '${Constant.apiUrl}${Constant.apiKey}&language=en&limit=$page';

    /// method of api excution
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    /// return the response from response.body json
    return (data['data'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }
}
