import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/movie_detail_response.dart';
import 'package:movieapp/repository/repository.dart';

class MovieDetailBloc {
  MovieRepository _movieRepository = MovieRepository();
  BehaviorSubject<MovieDetailResponse> _subject =
      BehaviorSubject<MovieDetailResponse>();

  getMovieDetails(int id) async {
    MovieDetailResponse response = await _movieRepository.getMovieDetail(id);
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

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
}

var movieDetailBloc = MovieDetailBloc();
