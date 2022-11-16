import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/get_movie.dart';
import 'package:movie_app/view/Movie_details/movie_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Movie>>(
        future: GetMoveiService().getMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Moviecard(
                movie: snapshot.data![index],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}

class Moviecard extends StatelessWidget {
  const Moviecard({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetails(movie:movie ,),)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.image.original,
                  height: 210,
                ),),
          ),
           Text(
              movie.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          
        
        ],
      ),
    );
  }
}
