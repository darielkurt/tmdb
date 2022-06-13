import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yify/data/models/genre.dart';

const baseImageUrl = 'https://image.tmdb.org/t/p/original/';

class Movie {
  Movie({
    this.id,
    this.title,
    this.overview,
    this.genres,
    this.poster_path,
    this.backdrop_path,
    this.release_date,
    this.vote_average,
    this.budget,
    this.revenue,
  });

  int? id;
  String? title;
  String? overview;
  List<Genre>? genres;
  String? poster_path;
  String? backdrop_path;
  String? release_date;
  double? vote_average;
  int? budget;
  int? revenue;

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        overview: json["overview"] == null ? null : json["overview"],
        poster_path: json["poster_path"] == null ? null : json["poster_path"],
        backdrop_path:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        release_date:
            json["release_date"] == null ? null : json["release_date"],
        vote_average:
            json["vote_average"] == null ? null : json["vote_average"],
        budget: json["budget"] == null ? null : json["budget"],
        revenue: json["revenue"] == null ? null : json["revenue"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title ?? null,
        "overview": overview == null ? null : overview,
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => x.toMap())),
        "poster_path": poster_path == null ? null : poster_path,
        "backdrop_path": backdrop_path == null ? null : backdrop_path,
        "release_date": release_date == null ? null : release_date,
        "vote_average": vote_average == null ? null : vote_average,
        "budget": budget == null ? null : budget,
        "revenue": revenue == null ? null : revenue,
      };

  String get imageUrl => '$baseImageUrl${backdrop_path}';
  String get thumbnailUrl => '$baseImageUrl${poster_path}';
  String get genreList =>
      genres == null ? '' : genres!.map((Genre genre) => genre.name).join(', ');
  String get budgetDisplay => budget == null ? '' : '\$${budget.toString()}';
  String get revenueDisplay => revenue == null ? '' : '\$${revenue.toString()}';
  Color? get ratingColor {
    if (vote_average == null) {
      return null;
    }

    if (vote_average! > 7) {
      return Colors.green;
    }

    if (vote_average! > 4) {
      return Colors.orange;
    }

    return Colors.red;
  }
}
