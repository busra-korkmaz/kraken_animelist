import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime.dart';

class AnimeService {
  final String baseUrl = 'https://api.jikan.moe/v4';

  Future<List<Anime>> fetchAnimeList(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/top/anime?page=$page'));
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['data'] as List)
          .map((anime) => Anime.fromJson(anime))
          .toList();
    } else {
      throw Exception('Yüklenemedi');
    }
  }
}
