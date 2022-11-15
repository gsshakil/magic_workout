import 'package:dartz/dartz.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';

class GetWorkoutDetailsUsecase {
  IWorkoutRepository workoutRepository;
  GetWorkoutDetailsUsecase({required this.workoutRepository});

  Either<Failure, WorkoutEntity?> call({required int id}) =>
      workoutRepository.getWorkoutDetails(id: id);
}
