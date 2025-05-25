import 'package:assesment_ravindra/data/repositories%20/workout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'workout_event.dart';
import 'workout_state.dart';

class WorkoutBLoC extends Bloc<WorkoutEvent, WorkoutState> {
  final WorkoutRepository repository;

  WorkoutBLoC(this.repository) : super(InitialWorkout()) {
    on<FetchWorkouts>((event, emit) async {
      emit(LoadingWorkout());
      try {
        final users = await repository.fetchWorkouts();
        emit(LoadedWorkout(users));
      } catch (e) {
        emit(ErrorWorkout(e.toString()));
      }
    });
  }
}
