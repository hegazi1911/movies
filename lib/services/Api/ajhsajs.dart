// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class Movie {
//   final String title;
//   final List<String> genres;

//   Movie({required this.title, required this.genres});
// }

// class MyApp extends StatelessWidget {
//   final List<String> allGenres = ['All', 'Action', 'Comedy', 'Drama', 'Sci-Fi', 'Thriller'];
//   String selectedGenre = 'All';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Genre Films'),
//         ),
//         body: Column(
//           children: [
//             _buildGenreDropdown(),
//             Expanded(
//               child: FutureBuilder<List<Movie>>(
//                 future: fetchMovies(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Text('No movies found for the selected genre.');
//                   } else {
//                     return _buildGenreLists(snapshot.data!);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGenreDropdown() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: DropdownButton<String>(
//         value: selectedGenre,
//         onChanged: (String? newValue) {
//           if (newValue != null) {
//             setState(() {
//               selectedGenre = newValue;
//             });
//           }
//         },
//         items: allGenres.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Future<List<Movie>> fetchMovies() async {
//     final response = await http.get('https://www.yts.nz/api/v2/list_movies.json');

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);

//       if (data['status'] == 'ok') {
//         final List<dynamic> moviesData = data['data']['movies'];

//         List<Movie> allMovies = moviesData.map((movieData) {
//           final List<dynamic> genres = movieData['genres'];
//           final String title = movieData['title'];
//           return Movie(title: title, genres: List<String>.from(genres));
//         }).toList();

//         return allMovies;
//       } else {
//         throw Exception('Failed to load data from YTS API');
//       }
//     } else {
//       throw Exception('Failed to load data from YTS API. Status code: ${response.statusCode}');
//     }
//   }

//   Widget _buildGenreLists(List<Movie> allMovies) {
//     if (selectedGenre == 'All') {
//       return _buildAllGenres(allMovies);
//     } else {
//       return _buildSingleGenre(allMovies);
//     }
//   }

//   Widget _buildAllGenres(List<Movie> allMovies) {
//     // Display all genres in a single list
//     return MovieList(movies: allMovies);
//   }

//   Widget _buildSingleGenre(List<Movie> allMovies) {
//     // Display movies for the selected genre only
//     List<Movie> genreMovies = allMovies.where((movie) => movie.genres.contains(selectedGenre)).toList();
//     return MovieList(movies: genreMovies);
//   }
// }

// class MovieList extends StatelessWidget {
//   final List<Movie> movies;

//   MovieList({required this.movies});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(movies[index].title),
//           subtitle: Text('Genres: ${movies[index].genres.join(', ')}'),
//         );
//       },
//     );
//   }
// }
