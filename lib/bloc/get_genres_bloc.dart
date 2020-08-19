import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/genre_response.dart';
import 'package:movieapp/repository/repository.dart';

class GenresListBloc {
  final MovieRepository _movieRepository = MovieRepository();
  BehaviorSubject<GenreResponse> _subject = BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _movieRepository.getGenre();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<GenreResponse> get subject => _subject;
}

final genresBloc = GenresListBloc();
