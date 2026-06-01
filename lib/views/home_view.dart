import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_bloc/providers/repository_inheritend.dart';
import 'package:test_bloc/views/task_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final repository = RepositoryInheritend.of(context).repository;
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Text('Total Tasks: ${repository.getTasks().length}'),
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskView()),
                );
                setState(() {});
              },
              child: Text('Go to Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
