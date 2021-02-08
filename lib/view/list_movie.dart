import 'package:flutter/material.dart';
import 'package:movieflix/data/base_url.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/data/network.dart';
import 'package:movieflix/view/detail_movie.dart';

class ListMovie extends StatefulWidget {
  @override
  _ListMovieState createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  Network network = Network();
  Future<MovieModel> popularMovies;
  Future<MovieModel> nowMovies;
  String urlImg = BaseUrl().imgUrl;

  @override
  void initState() {
    popularMovies = network.fetchPopularMovies();
    nowMovies = network.fetchNowMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16.0),
              child: SafeArea(
                child: Text(
                  'Movieflix',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Now Playing',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder(
                  future: nowMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("Has Data: ${snapshot.hasData}");
                      return Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.results.length,
                            itemBuilder: (context, index) => viewMovie(
                                urlImage:
                                    '$urlImg${snapshot.data.results[index].posterPath}',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailMovie(
                                                results: snapshot
                                                    .data.results[index],
                                              )));
                                })),
                      );
                    } else if (snapshot.hasError) {
                      print("Has Error: ${snapshot.hasError}");
                      return Text('Error!!!');
                    } else {
                      print("Loading...");
                      return LinearProgressIndicator();
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Popular',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print("Has Data: ${snapshot.hasData}");
                      return Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.results.length,
                            itemBuilder: (context, index) => viewMovie(
                                urlImage:
                                    '$urlImg${snapshot.data.results[index].posterPath}',
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailMovie(
                                                results: snapshot
                                                    .data.results[index],
                                              )));
                                })),
                      );
                    } else if (snapshot.hasError) {
                      print("Has Error: ${snapshot.hasError}");
                      return Text('Error!!!');
                    } else {
                      print("Loading...");
                      return LinearProgressIndicator();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewMovie({String urlImage, Function onPressed}) {
    return FlatButton(
        onPressed: onPressed,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(urlImage)));
  }
}
