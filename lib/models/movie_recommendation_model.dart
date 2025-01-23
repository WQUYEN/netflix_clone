import 'dart:convert';

class MovieRecommendationsModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieRecommendationsModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieRecommendationsModel.fromRawJson(String str) =>
      MovieRecommendationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      MovieRecommendationsModel(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false, // Mặc định là false nếu null
        backdropPath: json["backdrop_path"], // Giữ null nếu không có giá trị
        genreIds: (json["genre_ids"] != null)
            ? List<int>.from(json["genre_ids"].map((x) => x))
            : [], // Trả về danh sách rỗng nếu null
        id: json["id"] ?? 0, // Mặc định là 0 nếu null
        originalLanguage:
            json["original_language"] ?? "unknown", // Giá trị mặc định
        originalTitle:
            json["original_title"] ?? "No title available", // Giá trị mặc định
        overview:
            json["overview"] ?? "No overview available", // Giá trị mặc định
        popularity:
            json["popularity"]?.toDouble() ?? 0.0, // Mặc định là 0.0 nếu null
        posterPath: json["poster_path"], // Giữ null nếu không có giá trị
        releaseDate: (json["release_date"] != null &&
                json["release_date"] != "")
            ? DateTime.tryParse(json["release_date"]) ?? DateTime(1970, 1, 1)
            : DateTime(
                1970, 1, 1), // Mặc định là 1/1/1970 nếu null hoặc không hợp lệ
        title: json["title"] ?? "No title available", // Giá trị mặc định
        video: json["video"] ?? false, // Mặc định là false nếu null
        voteAverage:
            json["vote_average"]?.toDouble() ?? 0.0, // Mặc định là 0.0 nếu null
        voteCount: json["vote_count"] ?? 0, // Mặc định là 0 nếu null
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
