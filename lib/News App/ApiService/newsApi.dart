import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static NewsApi newsApi = NewsApi._();

  NewsApi._();

  Future fetchAppleCmpApiData() async {
    Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=86607fe243bf43e4867398998bc175d3'));

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future fetchTeslaCmpApiData() async {
    Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=86607fe243bf43e4867398998bc175d3'));

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future fetchBusinessHeadlinesData() async {
    Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=86607fe243bf43e4867398998bc175d3'));

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future fetchTechCrunchApiData() async {
    Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=86607fe243bf43e4867398998bc175d3'));

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }

  Future fetchArticlesApiData() async {
    Response response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=86607fe243bf43e4867398998bc175d3'));

    if (response.statusCode == 200) {
      final json = response.body;
      final data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
