import 'package:flutter/material.dart';
import 'package:test_bloc/repository/task_repository.dart';

class RepositoryInheritend extends InheritedWidget {
  final TaskRepository repository;

  RepositoryInheritend({
    super.key,
    required super.child,
    required this.repository,
  });

  static RepositoryInheritend of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RepositoryInheritend>()!;

  @override
  bool updateShouldNotify(covariant RepositoryInheritend oldWidget) {
    return repository != oldWidget.repository;
  }
}
