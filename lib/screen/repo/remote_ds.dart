import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c9_friday/models/NewsResponse.dart';
import 'package:news_c9_friday/models/SourcesResponse.dart';
import 'package:news_c9_friday/screen/repo/home_repo.dart';

import '../../shared/components/constants.dart';

class RemoteDataSource implements HomeRepo {
  @override
  Future<NewsResponse> getNewsData(String sourceId) async {
    try {
      Uri url = Uri.https(
          BASE_URL, "/v2/everything", {"apiKey": API_KEY, "sources": sourceId});
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonData);
      return newsResponse;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<SourcesResponse> getSources(String catId) async {
    try {
      Uri url = Uri.https(BASE_URL, "/v2/top-headlines/sources",
          {"apiKey": API_KEY, "category": catId});
      http.Response response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonData);
      return sourcesResponse;
    } catch (e) {
      throw Exception();
    }
  }
}
