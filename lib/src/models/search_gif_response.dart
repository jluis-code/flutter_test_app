// To parse this JSON data, do
//
//     final searchGifResponse = searchGifResponseFromMap(jsonString);

import 'dart:convert';

class SearchGifResponse {
    SearchGifResponse({
        required this.data,
        this.pagination,
        required this.meta,
    });

    List<GifData> data;
    Pagination? pagination;
    Meta meta;

    factory SearchGifResponse.fromJson(String str) => SearchGifResponse.fromMap(json.decode(str));

    factory SearchGifResponse.fromMap(Map<String, dynamic> json) => SearchGifResponse(
        data: List<GifData>.from(json["data"].map((x) => GifData.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
    );

}

class GifData {
    GifData({
        required this.id,
        required this.url,
        required this.title,
        required this.images,
    });

   
    String id;
    String url;
    String title;
    Images images;

    factory GifData.fromJson(String str) => GifData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GifData.fromMap(Map<String, dynamic> json) => GifData(
        id: json["id"],
        url: json["url"],
        title: json["title"],
        images: Images.fromMap(json["images"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "title": title,
        "images": images.toMap(),
    };
}


class Images {
    Images({
       required this.original,
    });

    FixedHeight original;

    factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        original: FixedHeight.fromMap(json["original"]),
    );

    Map<String, dynamic> toMap() => {
        "original": original.toMap(),
    };
}

class FixedHeight {
    FixedHeight({
        required this.url,
    });

    
    String url;

    factory FixedHeight.fromJson(String str) => FixedHeight.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FixedHeight.fromMap(Map<String, dynamic> json) => FixedHeight(
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "url": url,

    };
}

class Meta {
  
    Meta({
        required this.status,
        required this.msg,
        required this.responseId,
    });

    int status;
    String msg;
    String responseId;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        status: json["status"],
        msg: json["msg"],
        responseId: json["response_id"],
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "response_id": responseId,
    };
}

class Pagination {
    Pagination({
        required this.totalCount,
        required this.count,
        required this.offset,
    });

    int totalCount;
    int count;
    int offset;

    factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"],
        count: json["count"],
        offset: json["offset"],
    );

    Map<String, dynamic> toMap() => {
        "total_count": totalCount,
        "count": count,
        "offset": offset,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap;
        return reverseMap;
    }
}
