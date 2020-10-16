part of 'timekeeper_search_bloc.dart';

@immutable
abstract class TimekeeperSearchEvent {}

class SearchEvent extends TimekeeperSearchEvent {
  final String searchTerm;

  SearchEvent({this.searchTerm}) {
    print('SearchEvent: searchTerm -> {${this.searchTerm}}');
  }

  @override
  String toString() => 'SearchEvent -> { searchTerm: $searchTerm }';
}