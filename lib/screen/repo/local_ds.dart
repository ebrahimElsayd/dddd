import 'package:news_c9_friday/models/NewsResponse.dart';
import 'package:news_c9_friday/models/SourcesResponse.dart';
import 'package:news_c9_friday/screen/repo/home_repo.dart';

class LocalDataSource implements HomeRepo{
  @override
  Future<NewsResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourcesResponse> getSources(String catId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

}