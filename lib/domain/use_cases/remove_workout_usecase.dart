import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';

class RemoveWorkoutUsecase {
  IWorkoutRepository workoutRepository;
  RemoveWorkoutUsecase({required this.workoutRepository});

  Either<Failure, bool> call({required int id}) =>
      workoutRepository.removeWorkout(id: id);
}
