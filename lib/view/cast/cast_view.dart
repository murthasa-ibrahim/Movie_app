import 'package:flutter/material.dart';
import 'package:movie_app/model/cast_model.dart';
import 'package:movie_app/services/get_cast.dart';
import 'package:movie_app/view/cast_details.dart/cast_details.dart';

class CastView extends StatelessWidget {
  const CastView({Key? key, required this.movieId}) : super(key: key);
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cast',
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MovieCast>>(
        future: GetCastService().getCast(movieId),
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
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 270,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Cast(
                cast: snapshot.data![index],
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

class Cast extends StatelessWidget {
  const Cast({
    Key? key,
    required this.cast,
  }) : super(key: key);
  final MovieCast cast;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CastDetails(movie:cast ,),)),
      child: Column(
        children: [
            cast.character.image != null
         ? Padding(
           padding: const EdgeInsets.symmetric(vertical: 20),
           child: FadeInImage(
            
              height: 190,
              imageErrorBuilder: (context, error, stackTrace) => Container(
                color: Colors.green,
                height: 90,
                width: 70,
              ),
              placeholder:const AssetImage('asset/A_black_image.jpg'), 
              image: NetworkImage(cast.character.image!.original),fit: BoxFit.cover,),
         )
            :  Container(height: 190,color: Colors.black,width: 130,),
          Text(
            cast.character.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,               
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
