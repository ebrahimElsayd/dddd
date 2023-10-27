import 'package:news_c9_friday/models/NewsResponse.dart';
import 'package:news_c9_friday/models/SourcesResponse.dart';

abstract class HomeRepo {
  Future<SourcesResponse> getSources(String catId);

  Future<NewsResponse> getNewsData(String sourceId);
}
