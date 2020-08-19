import 'package:rxdart/rxdart.dart';
import 'package:movieapp/model/person_response.dart';
import 'package:movieapp/repository/repository.dart';

class PersonListBloc {
  final MovieRepository _movieRepository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject =
      BehaviorSubject<PersonResponse>();

  getPersons() async {
    PersonResponse response = await _movieRepository.getPersons();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personBloc = PersonListBloc();
