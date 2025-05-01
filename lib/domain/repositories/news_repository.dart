abstract class NewsRepository {
  Future<List<Map<String, dynamic>>> getNews(int page);
}
