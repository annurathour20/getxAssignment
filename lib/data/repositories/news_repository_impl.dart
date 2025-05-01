import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource dataSource;
  NewsRepositoryImpl(this.dataSource);

  @override
  Future<List<Map<String, dynamic>>> getNews(int page) async {
    return await dataSource.fetchNews(page);
  }
}
