import 'package:flutter/material.dart';
import 'package:news_app/News%20App/Model/newsModel.dart';
import 'package:news_app/News%20App/View/HomePage/homePage.dart';

class DetailsPage extends StatelessWidget {
  NewsModel? newsModel;

  DetailsPage({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    final date = newsModel!.articles[selectedIndex].publishedAt
        .split('T')
        .sublist(0, 1)
        .join(' ');
    final time = newsModel!.articles[selectedIndex].publishedAt
        .split('T')
        .sublist(1, 2)
        .join(' ');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff171717),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: height * 0.33,
                width: width,
                child: Image.network(newsModel!.articles[selectedIndex].urlToImage),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18, height * 0.2655, 18, 0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: const Color(0xff171717),
                        border: Border.all(color: Colors.white, width: 2.5)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsModel!.articles[selectedIndex].title,
                          style: TextStyle(
                              fontSize: width * 0.048,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Date : $date'),
                                Text('Published At : $time'),
                              ],
                            ),
                            Text(
                              newsModel!.articles[selectedIndex].source.name,
                              style: TextStyle(
                                  fontSize: width * 0.025, color: Colors.white),
                            ) //86607fe243bf43e4867398998bc175d3
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Author : ${newsModel!.articles[selectedIndex].author}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.042),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  newsController.launchNewsPage(newsModel);
                                },
                                child: Text(
                                  'Read More',//→
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: width * 0.042),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            newsModel!.articles[selectedIndex].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              // color: Colors.white
                            ),
                          ),
                          const SizedBox(height: 13),
                          Text(
                            newsModel!.articles[selectedIndex].content,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                              // color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
