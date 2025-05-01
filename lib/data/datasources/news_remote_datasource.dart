import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchNews(int page);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchNews(int page) async {
    final url =
        'https://api.thenewsapi.com/v1/news/all?api_token=q2UtkpxRtj21c4BHdncpz2enCJfIY7MH3F06wFQg&language=en&limit=3';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    return (data['data'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
  }
}
