import 'package:flutter/material.dart';
import 'package:flutter_todolist/todo.dart';
import 'package:intl/intl.dart';

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
        DateFormat.yMMMEd().format(DateTime.fromMillisecondsSinceEpoch(todo.dateTime)), // 한글로 바꾸려면 local 넣고 해야할듯
        // db에는 DateTime넣을 수 없다?
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
    );
  }
}
