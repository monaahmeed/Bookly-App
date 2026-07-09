import 'book_model.dart';

class Book {
  String? kind;
  int? totalItems;
  List<BookModel>? items;

  Book({this.kind, this.totalItems, this.items});

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    kind: json['kind'] as String?,
    totalItems: json['totalItems'] as int?,
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'totalItems': totalItems,
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
