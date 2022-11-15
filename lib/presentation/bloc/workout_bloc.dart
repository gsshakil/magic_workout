import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/use_cases/get_workout_detals_usecase.dart';
import 'package:magic_workout/domain/use_cases/get_workouts_usecase.dart';
import 'package:magic_workout/domain/use_cases/insert_workout_usecase.dart';
import 'package:magic_workout/domain/use_cases/remove_workout_usecase.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final GetWorkoutsUsecase getWorkoutsUsecase;
  final GetWorkoutDetailsUsecase getWorkoutDetailsUsecase;
  final InsertWorkoutUsecase insertWorkoutUsecase;
  final RemoveWorkoutUsecase removeWorkoutUsecase;

  WorkoutBloc({
    required this.getWorkoutsUsecase,
    required this.getWorkoutDetailsUsecase,
    required this.insertWorkoutUsecase,
    required this.removeWorkoutUsecase,
  }) : super(WorkoutInitial()) {
    on<GetWorkouts>((event, emit) {
      emit(WorkoutLoading());
      Either<Failure, Stream<List<WorkoutEntity?>>> result =
          getWorkoutsUsecase();
      result.fold((l) => emit(WorkoutFalure(message: l.message)), (r) {
        emit(GetWorkoutSSuccess(workouts: r));
      });
    });

    on<GetWorkoutDetails>((event, emit) {
      emit(WorkoutLoading());
      Either<Failure, WorkoutEntity?> result =
          getWorkoutDetailsUsecase(id: event.id);
      result.fold((l) => emit(WorkoutFalure(message: l.message)), (r) {
        emit(GetWorkoutDetailsSuccess(workout: r));
      });
    });

    on<InsertWorkout>((event, emit) {
      Either<Failure, int> result =
          insertWorkoutUsecase(workout: event.workout);
      result.fold((l) => emit(WorkoutFalure(message: l.message)), (r) {
        add(GetWorkouts());
      });
    });

    on<RemoveWorkout>((event, emit) {
      Either<Failure, bool> result = removeWorkoutUsecase(id: event.id);
      result.fold((l) => emit(WorkoutFalure(message: l.message)), (r) {
        add(GetWorkouts());
      });
    });
  }
}
