import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/core/di.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/presentation/bloc/workout_bloc.dart';
import 'package:magic_workout/presentation/widgets/workout_card.dart';
import 'package:magic_workout/presentation/widgets/workout_create_update_widget.dart';

class WorkoutListScreen extends StatelessWidget {
  const WorkoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutBloc = injector<WorkoutBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Workouts'),
        toolbarHeight: 80,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      ),
      body: BlocProvider.value(
        value: workoutBloc..add(GetWorkouts()),
        child: BlocConsumer<WorkoutBloc, WorkoutState>(
            builder: (context, state) {
              if (state is WorkoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetWorkoutsSuccess) {
                return StreamBuilder<List<WorkoutEntity?>>(
                  stream: state.workouts,
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final workouts = snapshot.data;

                      return workouts!.isEmpty
                          ? const Center(
                              child: Text('No Workout Found!'),
                            )
                          : ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                              itemCount: workouts.length,
                              itemBuilder: (context, index) {
                                final workout = workouts[index];
                                return WorkoutCard(workout: workout);
                              },
                              separatorBuilder: ((context, index) =>
                                  const Divider()),
                            );
                    }
                  }),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            listener: (context, state) {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return const WorkoutCreateUpdate(
                isEdit: false,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
