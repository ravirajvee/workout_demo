import 'package:assesment_ravindra/data/models/workout_model.dart';
import 'package:equatable/equatable.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
  @override
  List<Object> get props => [];
}

class InitialWorkout extends WorkoutState {}

class LoadingWorkout extends WorkoutState {}

class LoadedWorkout extends WorkoutState {
  final List<WorkoutModel> workouts;
  const LoadedWorkout(this.workouts);

  @override
  List<Object> get props => workouts;
}

class ErrorWorkout extends WorkoutState {
  final String message;

  const ErrorWorkout(this.message);

  @override
  List<Object> get props => [message];
}
