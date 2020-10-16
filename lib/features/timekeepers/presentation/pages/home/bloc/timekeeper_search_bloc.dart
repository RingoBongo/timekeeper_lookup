import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';
import 'package:myapp/features/timekeepers/domain/repositories/timekeeper_repository.dart';

part 'timekeeper_search_event.dart';
part 'timekeeper_search_state.dart';

class TimekeeperSearchBloc
    extends Bloc<TimekeeperSearchEvent, TimekeeperSearchState> {
  TimeKeeperDetailRepository timeKeeperDetailRepository;

  TimekeeperSearchBloc({this.timeKeeperDetailRepository})
      : super(TimekeeperSearchInitial());

  @override
  Stream<TimekeeperSearchState> mapEventToState(
    TimekeeperSearchEvent event,
  ) async* {
    print('mapEventToState => $event');

    if (event is SearchEvent) {
      yield SearchLoading();
      // await Future.delayed(const Duration(milliseconds: 1500), () {});
      //yield SearchComplete(timekeepers: null);
      try {
        print(event.searchTerm);
        print(timeKeeperDetailRepository);
        var failureOrTimekeepers = await timeKeeperDetailRepository
            .getTimeKeepers(tkinit: event.searchTerm);

        yield failureOrTimekeepers.fold(
          (failure) => throw UnimplementedError(),
          (timekeepers) => SearchComplete(timekeepers: timekeepers),
        );
      } catch (e) {
        yield SearchError(e.toString());
      }
    }
  }
}
