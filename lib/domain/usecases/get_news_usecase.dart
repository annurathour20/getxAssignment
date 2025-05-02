import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;
  GetNewsUseCase(this.repository);

  /// return api response thru the execute method
  Future<List<Map<String, dynamic>>> execute(int page) async {
    return await repository.getNews(page);
  }
}
