    import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/services/Api/get_all_movies.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:movies/widget/container_card.dart';

FutureBuilder<List<Movies>> customsugeestcard() {
    return FutureBuilder<List<Movies>>(
        future: getSugestMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final data = snapshot.data;
            List<Movies> movies = snapshot.data!;
            return CarouselSlider.builder(
                itemCount: movies.length,
               
                itemBuilder: (context, index , PageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      dynamic id = movies[index].id;
                      dynamic detalies = movies[index].summary;
                      dynamic image = movies[index].largeCoverImage;
                      dynamic quality1 = movies[index].torrents![0].quality;
                      dynamic url1 = movies[index].torrents![0].url;
                      dynamic url2 = movies[index].torrents![1].url;
                      dynamic quality2 = movies[index].torrents![1].quality;
                      context.goNamed('detalies', queryParameters: {
                        "id": id.toString(),
                        "detalies": detalies,
                        'image': image,
                        'quality1': quality1,
                        "quality2": quality2,
                        'url1': url1,
                        'url2': url2,
                      });
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24),
                        child: Containercard(
                          movies: movies[index],
                        )),
                  );
                }, options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                ),);
          } else {
            return Text(
                'No data available'); // Handle the case when the future completes, but there's no data.
          }
        });
  }