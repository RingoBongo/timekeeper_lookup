import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/features/timekeepers/data/datasources/timekeeper_detail_remote_data_source.dart';
import 'package:myapp/features/timekeepers/data/repositories/timekeeper_detail_repository_impl.dart';
import 'package:myapp/features/timekeepers/domain/repositories/timekeeper_repository.dart';
import 'package:myapp/features/timekeepers/presentation/pages/home/bloc/timekeeper_search_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(
    () => TimekeeperSearchBloc(timeKeeperDetailRepository: sl()),
  );

  // Repository
  sl.registerLazySingleton<TimeKeeperDetailRepository>(
    () => TimeKeeperDetailRepositorymplementation(
        timeKeeperDetailRemoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<TimeKeeperDetailRemoteDataSource>(
    () => TimeKeeperDetailRemoteDataSourceImpl(client: sl()),
  );

  //! External
  sl.registerLazySingleton(
    () => http.Client(),
  );
}
