import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/get_news_usecase.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../data/datasources/news_remote_datasource.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articles = [].obs;
  var page = 1;
  final scrollController = ScrollController();
  final getNewsUsecase = GetNewsUseCase(
    NewsRepositoryImpl(NewsRemoteDataSourceImpl()),
  );

  @override
  void onInit() {
    fetchNews();
    scrollController.addListener(_pagination);
    super.onInit();
  }

  void _pagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page++;
      fetchNews();
    }
  }

  void fetchNews() async {
    isLoading(true);
    final result = await getNewsUsecase.execute(page);
    articles.addAll(result);
    isLoading(false);
  }
}
