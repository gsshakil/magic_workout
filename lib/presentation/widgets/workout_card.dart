import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_workout/core/constants/color_constants.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/presentation/bloc/workout_bloc.dart';
import 'package:magic_workout/presentation/widgets/workout_create_update_widget.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final WorkoutEntity? workout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: WorkoutCreateUpdate(
                isEdit: true,
                workoutData: workout,
              ),
            );
          },
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 100,
          child: Image.asset(
            workout!.exercise == 'Deadlift'
                ? 'assets/images/deadlift.jpg'
                : workout!.exercise == 'Shoulder press'
                    ? 'assets/images/shoulder-press.jpg'
                    : workout!.exercise == 'Barbell row'
                        ? 'assets/images/barbell-row.jpg'
                        : workout!.exercise == 'Bench press'
                            ? 'assets/images/bench-press.jpg'
                            : 'assets/images/squat.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete_outline,
          color: ColorConstants.deleteColor,
        ),
        onPressed: () {
          BlocProvider.of<WorkoutBloc>(context)
              .add(RemoveWorkout(id: workout!.id));
        },
      ),
      title: Text(workout!.title ?? ''),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout!.exercise ?? 'No Exercise',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: ColorConstants.highlightColor),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                workout!.weight == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          const Icon(Icons.sports_gymnastics_sharp),
                          const SizedBox(width: 7),
                          Text(
                            workout!.weight.toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                workout!.stepCount == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          const Icon(Icons.numbers_sharp),
                          const SizedBox(width: 7),
                          Text(
                            workout!.stepCount.toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
