import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';

abstract class IWorkoutRepository {
  Either<Failure, Stream<List<WorkoutEntity?>>> getWorkouts();
  Either<Failure, WorkoutEntity?> getWorkoutDetails({required int id});
  Either<Failure, int> insertWorkout({required WorkoutEntity workout});
  Either<Failure, bool> removeWorkout({required int id});
}
