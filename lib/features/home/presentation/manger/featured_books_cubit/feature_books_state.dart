part of 'feature_books_cubit.dart';

@immutable
sealed class FeatureBooksState {}

final class FeatureBoxInitial extends FeatureBooksState {}
class FeaturedBooksLoading extends FeatureBooksState {}
class FeaturedBooksPaginationLoading extends FeatureBooksState {}
class FeatureBooksPaginationFailure extends FeatureBooksState {
  final String errMessage;

  FeatureBooksPaginationFailure(this.errMessage);

}
class FeaturedBooksFailure extends FeatureBooksState {
  final String errMessage;

  FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeatureBooksState{
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}