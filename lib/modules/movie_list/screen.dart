import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yify/data/models/movie.dart';
import 'package:yify/modules/movie_details/screen.dart';
import 'package:yify/modules/movie_list/controller.dart';

const baseImageUrl = 'https://image.tmdb.org/t/p/original/';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        elevation: 2.0,
        title: Text(
          'YTS',
          style: TextStyle(color: Colors.green[600]),
        ),
      ),
      body: SafeArea(
        child: GetX<MovieListScreenController>(
          init: MovieListScreenController(),
          builder: (MovieListScreenController controller) {
            return ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = controller.movieList[index];

                  return ListTile(
                    leading: CachedNetworkImage(
                      filterQuality: FilterQuality.none,
                      imageUrl: movie.thumbnailUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: Colors.grey,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    title: Text(movie.title ?? '-'),
                    subtitle: Text(movie.release_date ?? '-'),
                    onTap: () {
                      Get.dialog(MovieDetailsScreen(movie: movie));
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: controller.movieList.length);
          },
        ),
      ),
    );
  }
}
