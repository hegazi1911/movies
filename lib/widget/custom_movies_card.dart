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
decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(10.0), 
  ),              child:loadImageFromNetwork(movies.mediumCoverImage)) ,
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 100,
                      ) , 
                     
                      SizedBox(
                                          width: 100,


                        child: Text(
                          movies.genres!.join(', '),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
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

// Widget loadImageFromNetwork(String imageUrl) {
 
//   try {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Image.network(imageUrl, scale: 1.0),
//     );
//   } catch (e) {
//     print("Error loading image: $e");
//     return Image.asset("assets/images/medium-cover.jpg");
//   }}
Widget loadImageFromNetwork(String? imageUrl) {
  if (imageUrl == null) {
    return Image.asset("assets/images/medium-cover.jpg");
  }

  final completeUrl = 'https://www.yts.nz$imageUrl';

  return Image.network(
    completeUrl,
    scale: 1.0,
    // This is how you handle images that fail to load
    errorBuilder: (context, error, stackTrace) {
      // Replace this with a placeholder image asset
      return Image.asset("assets/images/medium-cover.jpg");
    },
  );
}
