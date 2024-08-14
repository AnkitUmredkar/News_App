import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/News%20App/Model/newsModel.dart';
import 'package:news_app/News%20App/View/DetailsPage/detailsPage.dart';
import '../../Controller/newsController.dart';

NewsController newsController = Get.put(NewsController());
int selectedIndex = 0;


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color(0xff171717),
          appBar: AppBar(
            backgroundColor: const Color(0xff171717),
            toolbarHeight: 75,
            leading: const Icon(Icons.menu,color: Colors.white,),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notification_add_outlined,color: Colors.white,))
            ],
            title: const Text("ARC News",style: TextStyle(color: Colors.white),),
            bottom: const TabBar(
              tabAlignment: TabAlignment.start,
                padding: EdgeInsets.zero,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                indicatorColor: Colors.blue,
                indicatorWeight: 2,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Row(
                    children: [Icon(Icons.apple), Text(' Apple')],
                  )),
                  Tab(
                      child: Row(
                    children: [
                      Icon(Icons.car_rental_outlined),
                      Text(' Tesla')
                    ],
                  )),
                  Tab(
                      child: Row(
                    children: [
                      Icon(Icons.credit_card),
                      Text(' Business')
                    ],
                  )),
                  Tab(
                      child: Row(
                    children: [
                      Icon(Icons.developer_board),
                      Text(' Technology')
                    ],
                  )),
                  Tab(
                      child: Row(
                                          children: [
                      Icon(Icons.mark_as_unread),
                      Text(' Articles')
                                          ],
                                        )),
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TabBarView(
              children: [
                FutureBuilder(
                  future: newsController.appleCmpData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModel? newsModel = snapshot.data;
                      newsController.generateRandomList(400);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            ...List.generate(
                                newsModel!.articles.length,
                                    (index) {
                                  final date = newsModel.articles[index].publishedAt.split('T').sublist(0,1).join(' ');
                                  final time = newsModel.articles[index].publishedAt.split('T').sublist(1,2).join(' ');
                                  return GestureDetector(
                                    onTap: (){
                                      selectedIndex = index;
                                      Get.to(DetailsPage(newsModel: newsModel,),transition: Transition.fade);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: height * 0.29,
                                            width: width,
                                            child: Image.network(
                                                newsModel.articles[index].urlToImage),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            newsModel.articles[index].title,
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Date : $date'),
                                                  Text('Published At : $time'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/whatsapp.png',height: width *0.063,color: const Color(0xffA1A1A1),),
                                                  Text('  ${newsController.randomList[index]}'.toString(),style: const TextStyle(color: Color(0xffA1A1A1)),),
                                                  const SizedBox(width: 10),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: width *0.063,)),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Divider(color:Colors.grey.shade500),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.teslaCmpData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModel? newsModel = snapshot.data;
                      newsController.generateRandomList(newsModel!.articles.length);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            ...List.generate(
                                newsModel!.articles.length,
                                    (index) {
                                  final date = newsModel.articles[index].publishedAt.split('T').sublist(0,1).join(' ');
                                  final time = newsModel.articles[index].publishedAt.split('T').sublist(1,2).join(' ');
                                  return GestureDetector(
                                    onTap: (){
                                      selectedIndex = index;
                                      Get.to(DetailsPage(newsModel: newsModel,),transition: Transition.fade);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: height * 0.29,
                                            width: width,
                                            child: Image.network(
                                                newsModel.articles[index].urlToImage),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            newsModel.articles[index].title,
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Date : $date'),
                                                  Text('Published At : $time'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/whatsapp.png',height: width *0.063,color: const Color(0xffA1A1A1),),
                                                  Text('  ${newsController.randomList[index]}'.toString(),style: const TextStyle(color: Color(0xffA1A1A1)),),
                                                  const SizedBox(width: 10),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: width *0.063,)),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Divider(color:Colors.grey.shade500),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.businessData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModel? newsModel = snapshot.data;
                      newsController.generateRandomList(newsModel!.articles.length);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            ...List.generate(
                                newsModel!.articles.length,
                                    (index) {
                                  final date = newsModel.articles[index].publishedAt.split('T').sublist(0,1).join(' ');
                                  final time = newsModel.articles[index].publishedAt.split('T').sublist(1,2).join(' ');
                                  return GestureDetector(
                                    onTap: (){
                                      selectedIndex = index;
                                      Get.to(DetailsPage(newsModel: newsModel,),transition: Transition.fade);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: height * 0.29,
                                            width: width,
                                            child: Image.network(
                                                newsModel.articles[index].urlToImage),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            newsModel.articles[index].title,
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Date : $date'),
                                                  Text('Published At : $time'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/whatsapp.png',height: width *0.063,color: const Color(0xffA1A1A1),),
                                                  Text('  ${newsController.randomList[index]}'.toString(),style: const TextStyle(color: Color(0xffA1A1A1)),),
                                                  const SizedBox(width: 10),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: width *0.063,)),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Divider(color:Colors.grey.shade500),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.techCrunchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModel? newsModel = snapshot.data;
                      newsController.generateRandomList(newsModel!.articles.length);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            ...List.generate(
                                newsModel!.articles.length,
                                    (index) {
                                  final date = newsModel.articles[index].publishedAt.split('T').sublist(0,1).join(' ');
                                  final time = newsModel.articles[index].publishedAt.split('T').sublist(1,2).join(' ');
                                  return GestureDetector(
                                    onTap: (){
                                      selectedIndex = index;
                                      Get.to(DetailsPage(newsModel: newsModel,),transition: Transition.fade);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: height * 0.29,
                                            width: width,
                                            child: Image.network(
                                                newsModel.articles[index].urlToImage),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            newsModel.articles[index].title,
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Date : $date'),
                                                  Text('Published At : $time'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/whatsapp.png',height: width *0.063,color: const Color(0xffA1A1A1),),
                                                  Text('  ${newsController.randomList[index]}'.toString(),style: const TextStyle(color: Color(0xffA1A1A1)),),
                                                  const SizedBox(width: 10),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: width *0.063,)),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Divider(color:Colors.grey.shade500),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: newsController.articlesData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      NewsModel? newsModel = snapshot.data;
                      newsController.generateRandomList(newsModel!.articles.length);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            ...List.generate(
                                newsModel!.articles.length,
                                    (index) {
                                  final date = newsModel.articles[index].publishedAt.split('T').sublist(0,1).join(' ');
                                  final time = newsModel.articles[index].publishedAt.split('T').sublist(1,2).join(' ');
                                  return GestureDetector(
                                    onTap: (){
                                      selectedIndex = index;
                                      Get.to(DetailsPage(newsModel: newsModel,),transition: Transition.fade);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: height * 0.29,
                                            width: width,
                                            child: Image.network(
                                                newsModel.articles[index].urlToImage),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            newsModel.articles[index].title,
                                            style: TextStyle(
                                                fontSize: width * 0.048,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Date : $date'),
                                                  Text('Published At : $time'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/whatsapp.png',height: width *0.063,color: const Color(0xffA1A1A1),),
                                                  Text('  ${newsController.randomList[index]}'.toString(),style: const TextStyle(color: Color(0xffA1A1A1)),),
                                                  const SizedBox(width: 10),
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,size: width *0.063,)),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Divider(color:Colors.grey.shade500),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
