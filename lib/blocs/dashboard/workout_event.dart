import 'package:equatable/equatable.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class FetchWorkouts extends WorkoutEvent {}
