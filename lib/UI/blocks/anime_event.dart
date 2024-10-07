abstract class AnimeEvent {}

class FetchAnimeList extends AnimeEvent {
  final int page;

  FetchAnimeList(this.page);
}
