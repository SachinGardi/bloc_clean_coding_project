import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding_project/data/response/api_response.dart';
import 'package:equatable/equatable.dart';
import '../../models/movies/movies.dart';
import '../../repository/movies/movies_api_repository.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{

  MoviesRepository moviesRepository;

  MoviesBloc({required this.moviesRepository}):super(MoviesState(moviesList: ApiResponse.loading())){
    on<MoviesFetched>(_fetchMoviesApiList);
  }

  Future<void> _fetchMoviesApiList(MoviesFetched event, Emitter<MoviesState> emit) async {

    await moviesRepository.fetchMoviesList().then((value){
          emit(state.copyWith(moviesList: ApiResponse.completed(value)));
    }).onError((error, stackTrace) {
      emit(state.copyWith(moviesList: ApiResponse.error(error.toString())));
    });
  }


}