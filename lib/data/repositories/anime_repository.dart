import '../models/anime.dart';
import '../services/anime_service.dart';

class AnimeRepository {
  final AnimeService animeService;

  AnimeRepository(this.animeService);

  Future<List<Anime>> fetchAnimeList(int page) {
    return animeService.fetchAnimeList(page);
  }
}
