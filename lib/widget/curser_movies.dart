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