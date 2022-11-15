import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/data/data_sources/i_workout_local_data_source.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';

class WorkoutRepository implements IWorkoutRepository {
  IWorkoutLocalDataSource workoutLocalDataSource;
  WorkoutRepository({required this.workoutLocalDataSource});

  @override
  Either<Failure, WorkoutEntity?> getWorkoutDetails({required int id}) {
    try {
      WorkoutEntity? result = workoutLocalDataSource.getWorkoutDetails(id: id);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Either<Failure, Stream<List<WorkoutEntity?>>> getWorkouts() {
    try {
      Stream<List<WorkoutEntity?>> result =
          workoutLocalDataSource.getWorkouts();
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Either<Failure, int> insertWorkout({required WorkoutEntity workout}) {
    try {
      int result = workoutLocalDataSource.insertWorkout(workout: workout);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(
        message: e.toString(),
      ));
    }
  }

  @override
  Either<Failure, bool> removeWorkout({required int id}) {
    try {
      bool result = workoutLocalDataSource.removeWorkout(id: id);
      return Right(result);
    } catch (e) {
      return Left(LocalFailure(
        message: e.toString(),
      ));
    }
  }
}
