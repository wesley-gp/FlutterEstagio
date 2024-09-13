
class Task {
  
  Task({required this.title, required this.data});
  
  Task.fromJson(Map<String, dynamic> json) 
  :  title = json['title'],
    data = DateTime.parse(json['datetime']);
  
  
  String title;
  DateTime data;
  toJson() {
    return {'title': title, 'datetime': data.toIso8601String()};
  }
}
