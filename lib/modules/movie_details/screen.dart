import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yify/data/models/movie.dart';
import 'package:yify/modules/movie_details/controller.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, this.movie}) : super(key: key);
  final Movie? movie;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: GetX<MovieDetailsScreenController>(
            init: MovieDetailsScreenController(defaultMovie: movie!),
            builder: (MovieDetailsScreenController controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: controller.movie?.imageUrl != null
                          ? CachedNetworkImage(
                              imageUrl: controller.movie?.imageUrl ?? '')
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 8.0),
                    ListTile(
                      title: Text(
                        controller.movie?.title ?? '-',
                        style: Get.textTheme.titleLarge,
                      ),
                      subtitle: Text(controller.movie?.genreList ?? ''),
                    ),
                    ListTile(
                      minLeadingWidth: 0,
                      minVerticalPadding: 0,
                      leading: Icon(
                        Icons.star,
                        color: controller.movie?.ratingColor,
                      ),
                      title: Text(
                        controller.movie?.vote_average.toString() ?? '-',
                        style: TextStyle(color: controller.movie?.ratingColor),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Release Date',
                        style: Get.textTheme.titleSmall,
                      ),
                      subtitle: Text(
                        controller.movie?.release_date ?? '-',
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Plot Summary',
                        style: Get.textTheme.titleSmall,
                      ),
                      subtitle: Text(controller.movie?.overview ?? '-'),
                    ),
                    ListTile(
                      title: Text(
                        'Budget',
                        style: Get.textTheme.titleSmall,
                      ),
                      subtitle: Text(controller.movie?.budgetDisplay ?? ''),
                    ),
                    ListTile(
                      title: Text(
                        'Revenue',
                        style: Get.textTheme.titleSmall,
                      ),
                      subtitle: Text(controller.movie?.revenueDisplay ?? ''),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
