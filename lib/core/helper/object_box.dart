import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<WorkoutEntity> _workoutBox;

  ObjectBox._init(this._store) {
    _workoutBox = Box<WorkoutEntity>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  WorkoutEntity? getWorkout(int id) => _workoutBox.get(id);

  Stream<List<WorkoutEntity>> getWorkouts() => _workoutBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());
  int insertWorkouts(WorkoutEntity workout) => _workoutBox.put(workout);

  bool deleteWorkouts(int id) => _workoutBox.remove(id);
}
