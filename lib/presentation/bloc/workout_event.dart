part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class GetWorkouts extends WorkoutEvent {}

class GetWorkoutDetails extends WorkoutEvent {
  final int id;
  const GetWorkoutDetails({required this.id});
}

class InsertWorkout extends WorkoutEvent {
  final WorkoutEntity workout;
  const InsertWorkout({required this.workout});
}

class RemoveWorkout extends WorkoutEvent {
  final int id;
  const RemoveWorkout({required this.id});
}
