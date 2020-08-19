import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/repository/repository.dart';

class SimilarMoviesBloc {
  MovieRepository _movieRepository = MovieRepository();
  BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async {
    MovieResponse response = await _movieRepository.getSimilarMovies(id);
    _subject.sink.add(response);
  }

  drainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
}

var similarMoviesBloc = SimilarMoviesBloc();
