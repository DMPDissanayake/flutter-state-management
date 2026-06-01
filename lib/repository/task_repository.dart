import '../data/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> getTasks() {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void toggleTask(int index) {
    _tasks[index] = _tasks[index].copyWith(isDone: !_tasks[index].isDone);
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
  }
}
