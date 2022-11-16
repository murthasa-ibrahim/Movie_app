import 'package:flutter/material.dart';
import 'package:movie_app/model/cast_model.dart';

class CastDetails extends StatelessWidget {
  const CastDetails({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieCast movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              movie.person.image.original,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.person.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              movie.person.birthday
                  .toString()
                  .replaceFirst('00:00:00.000', ''),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              movie.person.country.name.toString().replaceFirst('Name.', ''),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              movie.person.gender.toString().replaceFirst('Gender.', ''),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}