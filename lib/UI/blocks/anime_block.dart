import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/data/repositories/anime_repository.dart';

import 'anime_event.dart';
import 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final AnimeRepository animeRepository;

  AnimeBloc(this.animeRepository) : super(AnimeInitial()) {
    // FetchAnimeList olayını dinleyin
    on<FetchAnimeList>((event, emit) async {
      emit(AnimeLoading());
      try {
        final animeList = await animeRepository.fetchAnimeList(event.page);
        emit(AnimeLoaded(animeList));
      } catch (e) {
        emit(AnimeError("Yüklenemedi. Hata ${e.toString()}"));
      }
    });
  }
}
