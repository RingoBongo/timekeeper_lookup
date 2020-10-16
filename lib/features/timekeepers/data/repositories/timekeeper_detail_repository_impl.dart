import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/error/exception.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/timekeepers/data/datasources/timekeeper_detail_remote_data_source.dart';
import 'package:myapp/features/timekeepers/data/models/timekeeper_detail_model.dart';
import 'package:myapp/features/timekeepers/domain/repositories/timekeeper_repository.dart';

class TimeKeeperDetailRepositorymplementation
    implements TimeKeeperDetailRepository {
  final TimeKeeperDetailRemoteDataSource timeKeeperDetailRemoteDataSource;

  TimeKeeperDetailRepositorymplementation(
      {@required this.timeKeeperDetailRemoteDataSource});

  @override
  Future<Either<Failure, List<TimeKeeperDetailModel>>> getTimeKeepers(
      {String tkinit}) async {
    print('here');
    try {
      final List<TimeKeeperDetailModel> timekeepers =
          await timeKeeperDetailRemoteDataSource.getTimeKeepersFor(tkinit);
      return Right(timekeepers);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
