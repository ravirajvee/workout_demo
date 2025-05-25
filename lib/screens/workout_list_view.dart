import 'package:assesment_ravindra/blocs/dashboard/workout_bloc.dart';
import 'package:assesment_ravindra/blocs/dashboard/workout_state.dart';
import 'package:assesment_ravindra/data/models/workout_model.dart';
import 'package:assesment_ravindra/data/values/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.workoutsTxt),
      ),
      body: BlocBuilder<WorkoutBLoC, WorkoutState>(builder: (context, state) {
        if (state is LoadingWorkout) {
          return const LinearProgressIndicator();
        } else if (state is LoadedWorkout) {
          return ListView.builder(
              itemCount: state.workouts.length,
              itemBuilder: (context, index) {
                WorkoutModel workout = state.workouts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        workout.name ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${workout.duration} Minutes',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${workout.description}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else if (state is ErrorWorkout) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Press the button to fetch workouts'));
      }),
    );
  }
}
