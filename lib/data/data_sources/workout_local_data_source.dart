import 'package:magic_workout/data/data_sources/i_workout_local_data_source.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/main.dart';

class WorkoutLocalDataSource implements IWorkoutLocalDataSource {
  @override
  WorkoutEntity? getWorkoutDetails({required int id}) {
    WorkoutEntity? data = objectBox.getWorkout(id);
    return data;
  }

  @override
  Stream<List<WorkoutEntity>> getWorkouts() {
    Stream<List<WorkoutEntity>> data = objectBox.getWorkouts();
    return data;
  }

  @override
  int insertWorkout({required WorkoutEntity workout}) {
    final data = objectBox.insertWorkouts(workout);
    return data;
  }

  @override
  bool removeWorkout({required int id}) {
    final data = objectBox.deleteWorkouts(id);
    return data;
  }
}
