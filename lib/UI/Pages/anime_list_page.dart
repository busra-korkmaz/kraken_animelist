import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocks/anime_block.dart';
import '../blocks/anime_event.dart';
import '../blocks/anime_state.dart';
import 'anime_detail_page.dart';

class AnimeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Anime listesini başlat
    context.read<AnimeBloc>().add(FetchAnimeList(1));

    return Scaffold(
      appBar: AppBar(title: Text('Anime List')),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        builder: (context, state) {
          if (state is AnimeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AnimeLoaded) {
            return ListView.builder(
              itemCount: state.animeList.length,
              itemBuilder: (context, index) {
                final anime = state.animeList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnimeDetailPage(anime: anime),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 10.0,
                            height: 125.0,
                            color: Color(0xBbb4B2B3)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(anime.title!),
                                Text('Rating: ${anime.rating}'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 120.0,
                          width: 120.0,
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              Transform.translate(
                                offset: Offset(40.0, 10.0),
                                child: Container(
                                  height: 70.0,
                                  width: 55.0,
                                  color: Color.fromARGB(159, 214, 206, 209),
                                ),
                              ),
                              Transform.translate(
                                offset: Offset(25.0, 15.0),
                                child: Card(
                                  elevation: 20.0,
                                  child: Container(
                                    height: 70.0,
                                    width: 55.0,
                                    decoration: new BoxDecoration(
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
                              // Container(
                              //   width: 70,
                              //   height: 70,
                              //   child: 
                              // Image.network(anime.imageUrl!),

                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                // ListTile(
                //   title: Text(anime.title!),
                //   leading: Image.network(anime.imageUrl!),
                //   subtitle: Text('Rating: ${anime.rating}'),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => AnimeDetailPage(anime: anime),
                //       ),
                //     );
                //   },
                // );
              },
            );
          } else if (state is AnimeError) {
            return Center(child: Text(state.message));
          }
          return Container(); // Diğer durumlar için boş bir widget
        },
      ),
    );
  }
}
