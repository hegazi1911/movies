import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies/services/Model/details_movies_model.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;


class DetaliesMovies extends StatefulWidget {
  DetaliesMovies({
    super.key,
    required this.movieDetails,
    required this.detaliesMovie,
    required this.image,
    required this.quality,
    required this.quality1,
    required this.url1,
    required this.url2,

  });
  MovieDetails movieDetails;
  String detaliesMovie;
  String image;
String quality ; 
String quality1; 
String url1; 
String url2 ; 
  @override
  State<DetaliesMovies> createState() => _DetaliesMoviesState();
}

class _DetaliesMoviesState extends State<DetaliesMovies> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Image.network("https://www.yts.nz/${widget.image}"),
        SizedBox(
          height: 50,
        ),
        Text(
          (widget.movieDetails.title != null)
              ? widget.movieDetails.title!
              : 'movies text',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(widget.detaliesMovie,
              maxLines: showMore ? null : 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              )),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: Text(showMore ? 'See Less' : 'See More'),
        ),
        Row(
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () { launcher.launchUrl(Uri.parse("https://www.yts.nz${widget.url1}"),
                  mode: launcher.LaunchMode.externalApplication);},
                  icon: FaIcon(FontAwesomeIcons.cloudArrowDown , color: Colors.white, size: 50,),
                  
                ),
                                        SizedBox(height: 20) , 

                Text('quality : ${widget.quality}' , style: TextStyle(color:Colors.red ),)
              ],
            ),
            SizedBox(width: 50,) , 
              Column(
              children: [
                IconButton(
                  onPressed: () {launcher.launchUrl(Uri.parse("https://www.yts.nz${widget.url2}"),
                  mode: launcher.LaunchMode.externalApplication);},
                  icon: FaIcon(FontAwesomeIcons.cloudArrowDown , color: Colors.white, size: 50,),
                  
                ),
                        SizedBox(height: 20) , 

                Text('quality : ${widget.quality1}' , style: TextStyle(color:Colors.red ),)
              ],
            ),
          ],
        ),
        SizedBox(height: 50,)
      ],
    ));
  }
}
