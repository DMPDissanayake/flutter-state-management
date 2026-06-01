import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/data/task.dart';
import 'package:test_bloc/providers/repository_inheritend.dart';
import 'package:test_bloc/repository/task_repository.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    final repository = RepositoryInheritend.of(context).repository;
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context, repository),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Tasks Management')],
              ),
              SizedBox(height: 20.h),
              Text('Tasks List'),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: repository.getTasks().length,
                  itemBuilder: (context, index) {
                    final task = repository.getTasks()[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        children: [
                          Checkbox(
                            value: task.isDone,
                            onChanged: (value) => setState(() {
                              repository.toggleTask(index);
                            }),
                          ),
                          Column(
                            children: [
                              Text(task.title),
                              Text(task.description),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => setState(() {
                              repository.deleteTask(index);
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context, TaskRepository repository) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final task = Task(
                title: titleController.text,
                description: descriptionController.text,
                isDone: false,
              );
              setState(() => repository.addTask(task));
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
