import 'package:flutter/material.dart';

import '../../data/models/anime.dart';

class AnimeDetailPage extends StatelessWidget {
  final Anime anime;

  AnimeDetailPage({required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(anime.title!)),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: Offset(85.0, 0.0),
                child: Card(
                  elevation: 20.0,
                  child: Container(
                    height: 290.0,
                    width: 205.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid),
                    ),
                    child: Image.network(anime.imageUrl!),
                  ),
                ),
              ),
                 SizedBox(height: 30),
                      Text('${anime.title}', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      SizedBox(height: 10),
                      Text('Rating: ${anime.rating}',
                          style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      Text('Genres: ${anime.genres.join(', ')}'),
                      SizedBox(height: 10),
                      Text('Episodes: ${anime.episodesCount}'),
                      SizedBox(height: 10),
                      Text('Synopsis: ${anime.synopsis}'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
