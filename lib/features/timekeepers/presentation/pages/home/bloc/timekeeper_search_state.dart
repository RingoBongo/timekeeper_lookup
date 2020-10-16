part of 'timekeeper_search_bloc.dart';

@immutable
abstract class TimekeeperSearchState {}

class TimekeeperSearchInitial extends TimekeeperSearchState {}

class SearchInitial extends TimekeeperSearchState {
  @override
  String toString() => 'SearchInitial';
}

class SearchLoading extends TimekeeperSearchState {
  @override
  String toString() => 'SearchLoading';
}

class SearchComplete extends TimekeeperSearchState {
  final List<TimeKeeperDetailModel> timekeepers;

  SearchComplete({this.timekeepers});

  @override
  String toString() => 'SearchComplete';
}

class SearchError extends TimekeeperSearchState {
  final String message;

  SearchError(this.message);

  @override
  String toString() => 'SearchError - {$message}';
}