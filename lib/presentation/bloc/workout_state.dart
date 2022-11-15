part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitial extends WorkoutState {}

class WorkoutLoading extends WorkoutState {}

class WorkoutFalure extends WorkoutState {
  final String message;
  const WorkoutFalure({required this.message});
}

class GetWorkoutsSuccess extends WorkoutState {
  final Stream<List<WorkoutEntity?>> workouts;
  const GetWorkoutsSuccess({required this.workouts});
}

class GetWorkoutDetailsSuccess extends WorkoutState {
  final WorkoutEntity? workout;
  const GetWorkoutDetailsSuccess({required this.workout});
}

class InsertWorkoutSuccess extends WorkoutState {
  final int result;
  const InsertWorkoutSuccess({required this.result});
}

class RemoveWorkoutSuccess extends WorkoutState {
  final bool result;
  const RemoveWorkoutSuccess({required this.result});
}
