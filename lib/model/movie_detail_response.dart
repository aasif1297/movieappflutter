import 'package:movieapp/model/movie_detail.dart';

class MovieDetailResponse {
  final MovieDetail movieDetailsList;
  final String error;

  MovieDetailResponse(this.movieDetailsList, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetailsList = MovieDetail.fromJson(json),
        error = "";

  MovieDetailResponse.withError(String errorValue)
      : movieDetailsList = MovieDetail(null, null, null, null, "", null),
        error = errorValue;
}
