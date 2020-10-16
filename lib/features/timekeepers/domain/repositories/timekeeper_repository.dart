import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';

abstract class TimeKeeperDetailRepository {
  Future<Either<Failure, List<TimeKeeperDetailModel>>> getTimeKeepers(
      {String tkinit});
}
