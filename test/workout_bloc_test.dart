import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_workout/core/model/failure.dart';
import 'package:magic_workout/data/data_sources/workout_local_data_source.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';
import 'package:magic_workout/domain/repository/workout_repository.dart';
import 'package:magic_workout/domain/use_cases/get_workout_detals_usecase.dart';
import 'package:magic_workout/domain/use_cases/get_workouts_usecase.dart';
import 'package:magic_workout/domain/use_cases/insert_workout_usecase.dart';
import 'package:magic_workout/domain/use_cases/remove_workout_usecase.dart';
import 'package:magic_workout/presentation/bloc/workout_bloc.dart';

void main() {
  WorkoutLocalDataSource workoutLocalDataSource;
  WorkoutRepository workoutRepository;
  GetWorkoutsUsecase getWorkoutsUsecase;
  GetWorkoutDetailsUsecase getWorkoutDetailsUsecase;
  InsertWorkoutUsecase insertWorkoutUsecase;
  RemoveWorkoutUsecase removeWorkoutUsecase;
  WorkoutBloc workoutBloc;
  setUp(() {
    workoutLocalDataSource = WorkoutLocalDataSource();
    workoutRepository =
        WorkoutRepository(workoutLocalDataSource: workoutLocalDataSource);
    getWorkoutsUsecase =
        GetWorkoutsUsecase(workoutRepository: workoutRepository);
    getWorkoutDetailsUsecase =
        GetWorkoutDetailsUsecase(workoutRepository: workoutRepository);
    insertWorkoutUsecase =
        InsertWorkoutUsecase(workoutRepository: workoutRepository);
    removeWorkoutUsecase =
        RemoveWorkoutUsecase(workoutRepository: workoutRepository);
    workoutBloc = WorkoutBloc(
      getWorkoutsUsecase: getWorkoutsUsecase,
      getWorkoutDetailsUsecase: getWorkoutDetailsUsecase,
      insertWorkoutUsecase: insertWorkoutUsecase,
      removeWorkoutUsecase: removeWorkoutUsecase,
    );
  });

  group('Workout BlocTest', () {
    workoutLocalDataSource = WorkoutLocalDataSource();
    workoutRepository =
        WorkoutRepository(workoutLocalDataSource: workoutLocalDataSource);
    getWorkoutsUsecase =
        GetWorkoutsUsecase(workoutRepository: workoutRepository);
    getWorkoutDetailsUsecase =
        GetWorkoutDetailsUsecase(workoutRepository: workoutRepository);
    insertWorkoutUsecase =
        InsertWorkoutUsecase(workoutRepository: workoutRepository);
    removeWorkoutUsecase =
        RemoveWorkoutUsecase(workoutRepository: workoutRepository);

    workoutBloc = WorkoutBloc(
      getWorkoutsUsecase: getWorkoutsUsecase,
      getWorkoutDetailsUsecase: getWorkoutDetailsUsecase,
      insertWorkoutUsecase: insertWorkoutUsecase,
      removeWorkoutUsecase: removeWorkoutUsecase,
    );

    Stream<List<WorkoutEntity?>>? workouts = Stream.fromIterable([]);

    blocTest<WorkoutBloc, WorkoutState>(
      'Get Workouts: emits [WorkoutLoading, GetWorkoutsSuccess] when success',
      build: () => workoutBloc,
      act: (bloc) => bloc.add(GetWorkouts()),
      expect: () => [
        WorkoutLoading(),
        GetWorkoutsSuccess(workouts: workouts),
      ],
    );

    blocTest<WorkoutBloc, WorkoutState>(
      'Insert Workout: emits [WorkoutLoading, GetWorkoutsSuccess] when success',
      build: () => workoutBloc,
      act: (bloc) => bloc.add(
        InsertWorkout(
          workout: WorkoutEntity(
            id: 1,
            title: 'Hello',
            exercise: 'Squat',
            stepCount: 5,
            weight: 2,
          ),
        ),
      ),
      expect: () => [
        WorkoutLoading(),
        GetWorkoutsSuccess(workouts: workouts),
      ],
    );

    blocTest<WorkoutBloc, WorkoutState>(
      'Remove Workout: emits [WorkoutLoading, GetWorkoutsSuccess] when success',
      build: () => workoutBloc,
      act: (bloc) => bloc.add(const RemoveWorkout(id: 1)),
      expect: () => [
        WorkoutLoading(),
        GetWorkoutsSuccess(workouts: workouts),
      ],
    );
  });
}
