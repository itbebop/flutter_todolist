import 'package:flutter/material.dart';
import 'package:flutter_todolist/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // callBack 바깥에 통지
        onTap(todo);
      },
      leading: todo.isDone ? const Icon(Icons.check_circle, color: Colors.green) : const Icon(Icons.check_circle_outlined),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        '${todo.dateTime}',
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
    );
  }
}
