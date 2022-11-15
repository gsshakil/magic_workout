import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:magic_workout/core/constants/color_constants.dart';
import 'package:magic_workout/core/di.dart';
import 'package:magic_workout/core/widgets/form_elements/k_submit_button.dart';
import 'package:magic_workout/core/widgets/form_elements/k_text_field.dart';
import 'package:magic_workout/data/data_sources/excersize_static_data_source.dart';
import 'package:magic_workout/domain/entities/workout_entity.dart';
import 'package:magic_workout/presentation/bloc/workout_bloc.dart';

class WorkoutCreateUpdate extends HookWidget {
  const WorkoutCreateUpdate({
    Key? key,
    required this.isEdit,
    this.workoutData,
  }) : super(key: key);

  final bool isEdit;
  final WorkoutEntity? workoutData;

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final weightController = useTextEditingController();
    final stepCountController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final exerciseList = ExcersizeStaticDataSource.exerciseList;

    final workoutBloc = injector<WorkoutBloc>();

    ValueNotifier<String?> excersizeValue = useState(null);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () async {
        if (isEdit) {
          titleController.text = workoutData!.title!;
          weightController.text =
              workoutData!.weight != null ? workoutData!.weight.toString() : '';
          stepCountController.text = workoutData!.stepCount != null
              ? workoutData!.stepCount.toString()
              : '';
          excersizeValue.value = workoutData!.exercise.toString();
        }
      });
      return null;
    }, []);

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                      color: ColorConstants.inputBorderColor.withOpacity(0.2)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(isEdit
                            ? Icons.edit_outlined
                            : Icons.add_box_outlined),
                        const SizedBox(width: 20),
                        Text(
                          isEdit ? 'Edit Workout' : 'Create Workout',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      KTextField(
                        controller: titleController,
                        hintText: 'Title',
                        inputAction: TextInputAction.next,
                        validator: RequiredValidator(
                            errorText: 'Please enter a Workout title'),
                      ),
                      const SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        value: excersizeValue.value,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) =>
                            value == null ? 'field required' : null,
                        hint: const Text('Exercise'),
                        isExpanded: true,
                        items: exerciseList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) =>
                            setState(() => excersizeValue.value = newValue),
                      ),
                      const SizedBox(height: 20),
                      KTextField(
                        controller: weightController,
                        hintText: 'Weight',
                        inputAction: TextInputAction.next,
                        keyboardType: const TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 20),
                      KTextField(
                        controller: stepCountController,
                        hintText: 'Step Count',
                        inputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 20),
                      KSubmitButton(
                        title: isEdit ? 'Update' : 'Create',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final WorkoutEntity workout;
                            if (isEdit) {
                              workout = WorkoutEntity(
                                id: workoutData!.id,
                                title: titleController.text,
                                exercise: excersizeValue.value,
                                weight: double.tryParse(weightController.text),
                                stepCount:
                                    int.tryParse(stepCountController.text),
                              );
                            } else {
                              workout = WorkoutEntity(
                                title: titleController.text,
                                exercise: excersizeValue.value,
                                weight: double.tryParse(weightController.text),
                                stepCount:
                                    int.tryParse(stepCountController.text),
                              );
                            }

                            workoutBloc.add(InsertWorkout(workout: workout));
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
