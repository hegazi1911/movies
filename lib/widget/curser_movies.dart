// import 'package:carousel_slider/carousel_options.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movies/services/Model/movies_list_model.dart';

// class CarouselSlider extends ConsumerWidget {
//   CarouselSlider({super.key, required this.movies});
//   Movies movies;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return  Padding(
//       padding: const EdgeInsets.symmetric(vertical: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Comedy' , style:TextStyle( color: Colors.white , fontSize: 30),),
//           SizedBox(height: 15,),
//           SizedBox(width: double.infinity,
//                   child:CarouselSlider.builder(itemCount: 10, 
//                   itemBuilder: (context, itemIndex , pageViewIndex  ){
//     return Container(
//       height: 300,
//       width: 200,
//       color:Colors.red,
//     );
    
    
//                   },
//                    options: CarouselOptions(
    
//                     height: 300, 
//                     autoPlay: true, 
//                     viewportFraction: 0.55 , 
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     autoPlayAnimationDuration: Duration(seconds: 1)
//                    ))
//     )
//         ],
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/services/Model/movies_list_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  late Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
        Uri.parse('https://www.yts.nz/api/v2/list_movies.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Movie> movies = List.from(data['data']['movies']
          .map((movieData) => Movie.fromJson(movieData)));
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comedy',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(height: 15),
          FutureBuilder<List<Movie>>(
            future: futureMovies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No movies available.');
              } else {
                final movies = snapshot.data!;
                return SizedBox(
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      final movie = movies[itemIndex];
                      return Container(
                        height: 300,
                        width: 200,
                        color: Colors.red,
                        // Add your UI elements here, e.g., Image.network(movie.imageUrl),
                      );
                    },
                    options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: Duration(seconds: 1),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Movie {
  final String title;
  final String imageUrl;

  Movie({required this.title, required this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      imageUrl: json['large_cover_image'],
    );
  }
}
