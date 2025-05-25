import 'package:assesment_ravindra/data/models/workout_model.dart';
import 'package:assesment_ravindra/data/values/app_url.dart';
import 'package:http/http.dart' as http;

class WorkoutRepository {
  Future<List<WorkoutModel>> fetchWorkouts() async {
    final response = await http.get(Uri.parse(AppUrl.GET_WORKOUTs));
    if (response.statusCode == 200) {
      return workoutModelFromJson(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
