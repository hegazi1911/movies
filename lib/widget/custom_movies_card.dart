import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/services/Model/movies_list_model.dart';

class CustomMoviesCard extends ConsumerWidget {
  CustomMoviesCard({super.key, required this.movies});
  Movies movies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
        color: const Color.fromARGB(255, 41, 40, 40),
        height: 400,
        child: Row(children: [
          Container(
              height: 400,
              width: 100,
              color: Colors.red,
              child:  Image.asset("assets/images/medium-cover.jpg") 
),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 5),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    movies.title!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Row(
                    children: [
                      const Text(
                        "Rate :",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        movies.rating.toString(),
                        overflow: TextOverflow.visible,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        movies.genres!.join(', '),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
Widget loadImageFromNetwork(movies) {

  try {
    return  Image.network("https://www.yts.nz/${movies}" , scale: 1.0) ; 
  } catch (e) {
    print("Error loading image: $e");
    return Image.asset("assets/images/medium-cover.jpg"); 
  }
}