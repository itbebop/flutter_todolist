import 'package:flutter/material.dart';
import 'package:flutter_todolist/create_screen.dart';
import 'package:flutter_todolist/main.dart';
import 'package:flutter_todolist/todo.dart';
import 'package:flutter_todolist/todo_item.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 리스트'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await를 넣어서create화면에서 이쪽 화면으로 돌아올때까지 기다리도록 함
          // Navigator.push도 future타입임
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          setState(() {}); // create갔다가 다시 돌아오는 거 기다렸다가 화면 갱신
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: todos.values
            .map(
              (e) => TodoItem(
                todo: e,
                onTap: (todo) async {
                  todo.isDone = !todo.isDone;
                  await todo.save(); // future함수, hive제공, 이거 끝나고 setState하도록 await붙여줌

                  setState(() {});
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
