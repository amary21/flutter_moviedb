import 'package:flutter/material.dart';
import 'package:movieflix/data/base_url.dart';
import 'package:movieflix/models/movie_model.dart';

class DetailMovie extends StatelessWidget {
  final Results results;
  const DetailMovie({@required this.results});

  @override
  Widget build(BuildContext context) {
    String urlImg = BaseUrl().imgUrl;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network('$urlImg${results.backdropPath}'),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child:
                              Image.network('$urlImg${results.posterPath}'))),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, bottom: 16.0),
                              child: Text(
                                results.title,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child:
                                  Text('Release Date : ${results.releaseDate}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Popularity : ${results.popularity}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child:
                                  Text('Vote Average : ${results.voteAverage}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('Vote Count : ${results.voteCount}'),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
              child: Text(
                'Overview',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
              child: Text(
                results.overview,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
