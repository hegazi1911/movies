import 'package:flutter/material.dart';
import 'package:movies/services/Model/movies_list_model.dart';

class Containercard extends StatelessWidget {
 Containercard({super.key , required this.movies});
Movies movies ; 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://www.yts.nz${movies.mediumCoverImage!}'),
                              fit: BoxFit.contain,
                            ),
                          ),
      child:   Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: SizedBox(
                        width: 120,
                        child: Text(
                          movies.title!,
                          overflow: TextOverflow.ellipsis,
                          style:  TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
          ),



        ],
      ),
    );
  }
}
