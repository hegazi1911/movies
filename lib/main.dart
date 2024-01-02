import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies/view/detalies_page.dart';
import 'package:movies/view/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  routes: [
    GoRoute(name: 'homePage' , path: '/', builder: (context, state) =>  HomePage(), routes: [
      GoRoute(
        name: 'detalies' , 
        path: 'detalies',
        builder: (context, state) => const DetaliesPage(

        ),
      ),
      
    ]),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
