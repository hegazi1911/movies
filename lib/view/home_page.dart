import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/widget/custom_movies_card.dart';
import 'package:movies/services/Api/get_all_movies.dart';
import 'package:movies/services/Model/movies_list_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Movies>>(
          future: getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              List<Movies> movies = snapshot.data!;
              return GridView.builder(
                  itemCount: movies.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2,
                      crossAxisSpacing: .5,
                      mainAxisSpacing: 1.5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
dynamic id = movies[index].id ; 
dynamic detalies = movies[index].summary ; 
dynamic image = movies[index].largeCoverImage ; 
dynamic quality1  = movies[index].torrents![0].quality; 
dynamic url1  = movies[index].torrents![0].url; 
dynamic url2  = movies[index].torrents![1].url; 
dynamic quality2  = movies[index].torrents![1].quality; 
                      // context.go('/detalies/$id'); 
  context.goNamed('detalies',queryParameters: {"id" : id.toString() , "detalies" : detalies , 'image' : image , 'quality1': quality1  ,"quality2" : quality2 , 'url1':url1 , 'url2':url2});
                        
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: CustomMoviesCard(
                            movies: movies[index],
                          )),
                    );
                  });
            } else {
              return Text(
                  'No data available'); // Handle the case when the future completes, but there's no data.
            }
          }),
    );
  }
}
