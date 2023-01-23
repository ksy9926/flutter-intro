import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        // builder는 UI를 그려주는 함수이다.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: makeList(snapshot),
              )
            ]);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // ListView.builder 기능 + 구분자를 넣어주는 ListView
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );

    // 조금 더 최적화된 ListView
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: snapshot.data!.length,
    //   itemBuilder: (context, index) {
    //     var webtoon = snapshot.data![index];
    //     return Text(webtoon.title);
    //   },
    // );

    // 기본적인 ListView
    // return ListView(
    //   children: [
    //     for (var webtoon in snapshot.data!) Text(webtoon.title),
    //   ],
    // );
  }
}
