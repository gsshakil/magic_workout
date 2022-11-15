import 'package:magic_workout/domain/entities/workout_entity.dart';

abstract class IWorkoutLocalDataSource {
  Stream<List<WorkoutEntity?>> getWorkouts();
  WorkoutEntity? getWorkoutDetails({required int id});
  int insertWorkout({required WorkoutEntity workout});
  bool removeWorkout({required int id});
}
