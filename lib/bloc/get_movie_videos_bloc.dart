import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/movie_response.dart';
import 'package:movieapp/model/video_response.dart';
import 'package:movieapp/repository/repository.dart';

class MoviesVideosBloc {
  MovieRepository _movieRepository = MovieRepository();
  BehaviorSubject<VideoResponse> _subject = BehaviorSubject<VideoResponse>();

  getMovieVideos(int id) async {
    VideoResponse response = await _movieRepository.getVideos(id);
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

  BehaviorSubject<VideoResponse> get subject => _subject;
}

var movieVideosBloc = MoviesVideosBloc();
