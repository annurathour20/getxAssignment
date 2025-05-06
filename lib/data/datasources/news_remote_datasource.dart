import 'dart:convert';
import 'package:assignment/presentation/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchNews(int page);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchNews(int page) async {
    /// get and store api key in FlutterSecureStorage()
    final storage = FlutterSecureStorage();
    await storage.write(key: Constant.apiKey,value:'q2UtkpxRtj21c4BHdncpz2enCJfIY7MH3F06wFQg');
    final apiKey = await storage.read(key: Constant.apiKey);
    try{
    /// api url point
    final url = '${Constant.apiUrl}$apiKey&language=en&limit=$page';
    /// method of api execution
    final response = await http.get(Uri.parse(url));
    /// if status code ==200 return the api response
    if(response.statusCode==200){
      final data = json.decode(response.body);
      /// return the response from response.body json
      return (data['data'] as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();
     }/// if response.statusCode != 200 then return api failed msg with status code
    else {
      print('API failed with status: ${response.statusCode}');
      return [];
    }
    }catch (e) {
  print('Error fetching news: $e');
  return [];
  }
}}
