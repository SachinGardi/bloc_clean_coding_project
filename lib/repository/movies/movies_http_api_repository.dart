import 'package:bloc_clean_coding_project/utils/app_url.dart';
import 'package:bloc_clean_coding_project/data/network/network_services_api.dart';
import 'package:bloc_clean_coding_project/models/movies/movies.dart';
import 'package:bloc_clean_coding_project/repository/movies/movies_api_repository.dart';

class MoviesHttpApiRepository implements MoviesRepository{

  final _apiServices = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }

}