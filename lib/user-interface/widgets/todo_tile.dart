import 'package:flutter/material.dart';
import '../../data/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  final TodoModel todo;

  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(todo.todo),
      value: todo.completed,
      onChanged: null, // View-only
    );
  }
}
