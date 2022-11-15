import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';

class InsertWorkoutUsecase {
  IWorkoutRepository workoutRepository;
  InsertWorkoutUsecase({required this.workoutRepository});

  Either<Failure, int> call({required WorkoutEntity workout}) =>
      workoutRepository.insertWorkout(workout: workout);
}
