/*
 * *
 *  * film_data_model.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:25
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:25
 *
 */

class FilmDataModel {
  final String? title;
  final int? episodeId;
  final String? openingCrawl;
  final String? director;
  final String? producer;
  final DateTime? releaseDate;
  final List<String>? characters;
  final List<String>? planets;
  final List<String>? starships;
  final List<String>? vehicles;
  final List<String>? species;
  final DateTime? created;
  final DateTime? edited;
  final String? url;

  FilmDataModel({
    this.title,
    this.episodeId,
    this.openingCrawl,
    this.director,
    this.producer,
    this.releaseDate,
    this.characters,
    this.planets,
    this.starships,
    this.vehicles,
    this.species,
    this.created,
    this.edited,
    this.url,
  });

  factory FilmDataModel.fromJson(Map<String, dynamic> json) => FilmDataModel(
        title: json["title"],
        episodeId: json["episode_id"],
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        characters: json["characters"] == null
            ? []
            : List<String>.from(json["characters"]!.map((x) => x)),
        planets: json["planets"] == null
            ? []
            : List<String>.from(json["planets"]!.map((x) => x)),
        starships: json["starships"] == null
            ? []
            : List<String>.from(json["starships"]!.map((x) => x)),
        vehicles: json["vehicles"] == null
            ? []
            : List<String>.from(json["vehicles"]!.map((x) => x)),
        species: json["species"] == null
            ? []
            : List<String>.from(json["species"]!.map((x) => x)),
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "episode_id": episodeId,
        "opening_crawl": openingCrawl,
        "director": director,
        "producer": producer,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "characters": characters == null
            ? []
            : List<dynamic>.from(characters!.map((x) => x)),
        "planets":
            planets == null ? [] : List<dynamic>.from(planets!.map((x) => x)),
        "starships": starships == null
            ? []
            : List<dynamic>.from(starships!.map((x) => x)),
        "vehicles":
            vehicles == null ? [] : List<dynamic>.from(vehicles!.map((x) => x)),
        "species":
            species == null ? [] : List<dynamic>.from(species!.map((x) => x)),
        "created": created?.toIso8601String(),
        "edited": edited?.toIso8601String(),
        "url": url,
      };
}
