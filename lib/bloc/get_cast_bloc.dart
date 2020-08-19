import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/cast_response.dart';
import 'package:movieapp/repository/repository.dart';

class CastListBloc {
  MovieRepository _movieRepository = MovieRepository();
  BehaviorSubject<CastResponse> _subject = BehaviorSubject<CastResponse>();

  getCast(int id) async {
    CastResponse response = await _movieRepository.getCast(id);
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

  BehaviorSubject<CastResponse> get subject => _subject;
}

var castBloc = CastListBloc();
