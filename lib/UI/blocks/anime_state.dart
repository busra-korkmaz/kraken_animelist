
import '../../data/models/anime.dart';

abstract class AnimeState {}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {}

class AnimeLoaded extends AnimeState {
  final List<Anime> animeList;

  AnimeLoaded(this.animeList);
}

class AnimeError extends AnimeState {
  final String message;

  AnimeError(this.message);
}
