import 'package:assesment_ravindra/blocs/dashboard/workout_bloc.dart';
import 'package:assesment_ravindra/blocs/dashboard/workout_event.dart';
import 'package:assesment_ravindra/data/repositories%20/workout_repo.dart';
import 'package:assesment_ravindra/data/values/app_string.dart';
import 'package:assesment_ravindra/screens/workout_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Ravi',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        AppString.homePageMsg,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Stats Cards

              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: _buildStatCard(AppString.inProgressTxt, '🐣',
                      '2 ${AppString.workoutsTxt}', Colors.white),),
                  const SizedBox(width: 16),
                  Flexible(
                    fit: FlexFit.tight,
                    child: _buildStatCard(
                      AppString.timeSpentTxt, '⏰', '62 Minutes', Colors.white),)
                ],
              ),
              const SizedBox(height: 26),
              _buildProgressCard(
                  AppString.finishedDays, '💪', '30', Colors.white, context),

              const SizedBox(height: 26),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String emoji, String value, Color bgColor,
      {bool isLarge = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (emoji.isNotEmpty && isLarge)
            Text(
              emoji,
              style: TextStyle(fontSize: 24),
            ),
          const SizedBox(height: 8),
          Text(
            '${isLarge ? '' : emoji}$value',
            style: TextStyle(
              fontSize: isLarge ? 42 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(
    String title,
    String emoji,
    String value,
    Color bgColor,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emoji,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customWidths:
                      CustomSliderWidths(progressBarWidth: 8, trackWidth: 10),
                  customColors: CustomSliderColors(
                    trackColor: AppColors.primary100,
                    progressBarColor: AppColors.primary400,
                    dotColor: AppColors.silver,
                    hideShadow: true,
                  ),
                  size: 120,
                  startAngle: 180,
                  angleRange: 180,
                ),
                innerWidget: (_) => const Center(
                  child: Text(
                    "100 / 30",
                  ),
                ),
                min: 0,
                max: 100,
                initialValue: (30).toDouble(),
              )
            ],
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) =>
                        WorkoutBLoC(WorkoutRepository())..add(FetchWorkouts()),
                    child: const WorkoutListView(),
                  ),
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppString.workoutsTxt,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary600,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: AppColors.primary600,
                  size: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
