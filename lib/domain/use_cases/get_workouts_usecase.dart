import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';

class GetWorkoutsUsecase {
  IWorkoutRepository workoutRepository;
  GetWorkoutsUsecase({required this.workoutRepository});

  Either<Failure, Stream<List<WorkoutEntity?>>> call() =>
      workoutRepository.getWorkouts();
}
