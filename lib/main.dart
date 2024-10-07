import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/UI/Pages/anime_list_page.dart';
import 'UI/blocks/anime_block.dart';
import 'data/services/anime_service.dart';
import 'data/repositories/anime_repository.dart';

void main() {
  final animeService = AnimeService();
  final animeRepository = AnimeRepository(animeService);

  runApp(MyApp(animeRepository: animeRepository));
}

class MyApp extends StatelessWidget {
  final AnimeRepository animeRepository;

  MyApp({required this.animeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(animeRepository),
      child: MaterialApp(
        title: 'Kraken Anime List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimeListPage(),
      ),
    );
  }
}
