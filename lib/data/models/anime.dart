class Anime {
  final String title;
  final String? imageUrl; 
  final double? rating;
  final String synopsis;
  final List<String> genres;
  final int? episodesCount;

  Anime({
    required this.title,
    this.imageUrl,
    required this.rating,
    required this.synopsis,
    required this.genres,
    required this.episodesCount,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      title: json['title'],
      imageUrl: json['images']['jpg']['image_url'], 
      rating: json['score'].toDouble(),
      synopsis: json['synopsis'],
      genres: List<String>.from(json['genres'].map((genre) => genre['name'])),
      episodesCount: json['episodes'],
    );
  }
}
