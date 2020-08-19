import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movieapp/model/movie.dart';
import 'package:movieapp/model/movie_response.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> recentMovies;

  @override
  void initState() {
    super.initState();
  }

  Future<MovieResponse> getRecentMovies() async {
    var dio = Dio();
    var response =
        await dio.get('https://api.themoviewdb.org/3//discover/movie');
    return MovieResponse.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1D1D27),
        body: main_widget(),
      ),
    );
  }

  Widget main_widget() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            addSpace(20),
            TextField(
              decoration: InputDecoration(
                hintText: "Movies, Actors, Directors",
                hintStyle: TextStyle(fontSize: 28, color: Color(0xFF5C5C6A)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5C5C6A)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5C5C6A)),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Recent",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "See All".toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF9EA3B5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            addSpace(20),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return _listItem(index, context);
                  }),
            ),
            Container(
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "See All".toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF9EA3B5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            addSpace(10),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return _listItemVertical(index, context);
                }),
          ],
        ),
      ),
    );
  }

  Widget _listItem(int index, BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: (index == 0) ? null : EdgeInsets.only(left: 14),
          height: 200,
          width: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://image.freepik.com/free-psd/urban-graffiti-mockup_23-2147762888.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        addSpace(10),
        Container(
          margin: (index == 0) ? null : EdgeInsets.only(left: 14),
          child: Text(
            "Hello World",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  Widget _listItemVertical(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://image.freepik.com/free-psd/urban-graffiti-mockup_23-2147762888.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deadpool 2",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                addSpace(5),
                Text(
                  "1h 59min",
                  style: TextStyle(color: Colors.white),
                ),
                addSpace(8),
                Text(
                  "Adventure, Action, Comedy",
                  style: TextStyle(color: Color(0xFF5C5C6A), fontSize: 12),
                ),
                Text(
                  "Director: David Sheikh",
                  style: TextStyle(color: Color(0xFF5C5C6A), fontSize: 12),
                ),
                addSpace(12),
                Row(
                  children: [
                    Container(
                        child: Icon(
                      Icons.star,
                      color: Colors.red,
                    )),
                    Text(
                      ' 7.8 ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/10',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                addSpace(16),
                Text(
                  '189 Reviews',
                  style: TextStyle(color: Color(0xFF5C5C6A), fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget addSpace(double value) {
    return Container(
      margin: EdgeInsets.only(top: value),
    );
  }
}
