import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/services/Riverpod/change_page.dart';
import 'package:movies/view/search.dart';
import 'package:movies/widget/all_Movies.dart';
import 'package:movies/widget/custom_sugest_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageNum = ref.watch(PageNumber);
    print('PageNum ${PageNum.pagenum}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("MoOov" , style: TextStyle(color: Colors.red),)),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchMovies());
              },
              icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: const Text(
              'Sugest Movies',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          customsugeestcard(),
          Expanded(child: allMovies(PageNum.pagenum)),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  PageNum.decrease();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 300,
              ),
              GestureDetector(
                onTap: () {
                  PageNum.increase();
                },
                child: Row(
                  children: [
                    Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
