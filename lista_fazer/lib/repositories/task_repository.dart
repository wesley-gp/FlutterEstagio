import 'dart:convert';

import 'package:lista_fazer/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  late SharedPreferences sharedPreferences;
  final String taskKey = "task_list";

  Future<List<Task>> getTaskList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(taskKey) ?? '[]';
    final List jsonDecoded = jsonDecode(jsonString) as List;
    return jsonDecoded.map((e) => Task.fromJson(e)).toList();
  }

  saveTaskList(List<Task> tasks) {
    String jsonString = json.encode(tasks);
    sharedPreferences.setString(taskKey, jsonString);
  }
}
