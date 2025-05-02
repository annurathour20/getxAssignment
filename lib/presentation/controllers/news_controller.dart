import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/get_news_usecase.dart';
import '../../data/repositories/news_repository_impl.dart';
import '../../data/datasources/news_remote_datasource.dart';

class NewsController extends GetxController {
  /// Indicates whether the news data is currently being loaded.
  var isLoading = true.obs;

  /// List of fetched articles. Observed to update the UI on change.
  var articles = [].obs;

  /// initialize the value of Current page number used for pagination.
  var page = 1;

  /// Scroll controller to monitor scrolling and trigger pagination.
  final scrollController = ScrollController();

  /// Use case instance to fetch news articles from the repository.
  final getNewsUsecase = GetNewsUseCase(
    NewsRepositoryImpl(NewsRemoteDataSourceImpl()),
  );

  /// Called when the controller is initialized.
  /// Starts the initial data fetch and sets up scroll listener for pagination.
  @override
  void onInit() {
    fetchNews();
    scrollController.addListener(_pagination);
    super.onInit();
  }

  /// Triggers a fetch of the next page when the user scrolls to the bottom.

  void _pagination() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page++;
      fetchNews();
    }
  }

  /// Fetches news articles from the API and adds them to the articles list.

  void fetchNews() async {
    isLoading(true);
    final result = await getNewsUsecase.execute(page);
    articles.addAll(result);
    isLoading(false);
  }
}
