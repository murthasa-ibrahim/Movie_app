import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movie_app/model/cast_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/view/cast/cast_view.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details',
            style: Theme.of(context).textTheme.headline4!.copyWith()),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                movie.image.original,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              movie.name,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
            ),
            Html(data:movie.summary,),
            
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CastView(movieId: movie.id),));
            }, child:const Text('See full cast',style: TextStyle(fontSize: 18,)))
          ],
        ),
      ),
    );
  }
}
