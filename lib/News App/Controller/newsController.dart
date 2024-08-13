import 'dart:math';
import 'package:get/get.dart';
import 'package:news_app/News%20App/ApiService/newsApi.dart';
import 'package:news_app/News%20App/Model/newsModel.dart';
import 'package:news_app/News%20App/View/HomePage/homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsController extends GetxController{
  NewsModel? newsModel;
  List randomList = [];
  Random random = Random();

  Future<NewsModel?> appleCmpData() async {
    final data = await  NewsApi.newsApi.fetchAppleCmpApiData();
    newsModel = NewsModel.fromJson(data);
    return newsModel;
  }

  Future<NewsModel?> teslaCmpData() async {
    final data = await  NewsApi.newsApi.fetchTeslaCmpApiData();
    newsModel = NewsModel.fromJson(data);
    return newsModel;
  }

  Future<NewsModel?> businessData() async {
    final data = await  NewsApi.newsApi.fetchBusinessHeadlinesData();
    newsModel = NewsModel.fromJson(data);
    return newsModel;
  }

  Future<NewsModel?> techCrunchData() async {
    final data = await  NewsApi.newsApi.fetchTechCrunchApiData();
    newsModel = NewsModel.fromJson(data);
    return newsModel;
  }

  Future<NewsModel?> articlesData() async {
    final data = await  NewsApi.newsApi.fetchArticlesApiData();
    newsModel = NewsModel.fromJson(data);
    return newsModel;
  }

  void launchNewsPage(NewsModel? newsModel){
    Uri url = Uri.parse(newsModel!.articles[selectedIndex].url);
    launchUrl(url, mode: LaunchMode.inAppWebView);
  }

  void generateRandomList(int length){
    for(int i=0; i<length+1; i++){
      int a = random.nextInt(length);
      randomList.add(a);
    }
  }
}