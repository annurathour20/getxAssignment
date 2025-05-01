import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;
  GetNewsUseCase(this.repository);

  Future<List<Map<String, dynamic>>> execute(int page) async {
    return await repository.getNews(page);
  }
}
