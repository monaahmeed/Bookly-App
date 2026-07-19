import 'package:bookly_app/core/utils/functions/build_error_snack_bar.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatuedBooksListViewBlocConsumer extends StatefulWidget {
  const FeatuedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeatuedBooksListViewBlocConsumer> createState() => _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState extends State<FeatuedBooksListViewBlocConsumer> {
   List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeatureBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildErrorWidget(state.errMessage),
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeatureBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}