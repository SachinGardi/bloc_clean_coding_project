part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable{

  const MoviesEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class MoviesFetched extends MoviesEvent{}

