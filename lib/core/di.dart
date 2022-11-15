import 'package:get_it/get_it.dart';
import 'package:magic_workout/data/data_sources/i_workout_local_data_source.dart';
import 'package:magic_workout/data/data_sources/workout_local_data_source.dart';
import 'package:magic_workout/domain/repository/i_workout_repository.dart';
import 'package:magic_workout/domain/repository/workout_repository.dart';
import 'package:magic_workout/domain/use_cases/get_workout_detals_usecase.dart';
import 'package:magic_workout/domain/use_cases/get_workouts_usecase.dart';
import 'package:magic_workout/domain/use_cases/insert_workout_usecase.dart';
import 'package:magic_workout/domain/use_cases/remove_workout_usecase.dart';
import 'package:magic_workout/presentation/bloc/workout_bloc.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  // Data sources
  injector.registerLazySingleton<IWorkoutLocalDataSource>(
      () => WorkoutLocalDataSource());

  // Repositories
  injector.registerLazySingleton<IWorkoutRepository>(
      () => WorkoutRepository(workoutLocalDataSource: injector()));

  // Use Cases
  injector.registerLazySingleton<GetWorkoutsUsecase>(
      () => GetWorkoutsUsecase(workoutRepository: injector()));

  injector.registerLazySingleton<GetWorkoutDetailsUsecase>(
      () => GetWorkoutDetailsUsecase(workoutRepository: injector()));

  injector.registerLazySingleton<InsertWorkoutUsecase>(
      () => InsertWorkoutUsecase(workoutRepository: injector()));

  injector.registerLazySingleton<RemoveWorkoutUsecase>(
      () => RemoveWorkoutUsecase(workoutRepository: injector()));

  injector.registerLazySingleton<WorkoutBloc>(() => WorkoutBloc(
        getWorkoutsUsecase: injector(),
        getWorkoutDetailsUsecase: injector(),
        insertWorkoutUsecase: injector(),
        removeWorkoutUsecase: injector(),
      ));
}
