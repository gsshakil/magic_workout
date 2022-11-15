import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class WorkoutEntity extends Equatable {
  int id;
  String? title;
  String? exercise;
  double? weight;
  int? stepCount;

  WorkoutEntity({
    this.id = 0,
    this.title,
    this.exercise,
    this.weight,
    this.stepCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        exercise,
        weight,
        stepCount,
      ];
}
