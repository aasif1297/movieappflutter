import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/repository/repository.dart';

class MoviesListByGenreBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  getMovies(int id) async {
    MovieResponse response = await _movieRepository.getMovieByGenre(id);
    _subject.sink.add(response);
  }

  void dainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesByGenreBloc = MoviesListByGenreBloc();
