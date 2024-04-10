import 'package:flutter/material.dart';
import 'package:flutter_todolist/list_screen.dart';
import 'package:flutter_todolist/todo.dart';
import 'package:hive_flutter/adapters.dart';

// 기능상 좋지 않으나 난이도 낮추기 위해서 static으로 선언
late final Box<Todo> todos;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  todos = await Hive.openBox('todolist.db');
  // 이 객체를 통해서 db에 접근할 수 있음

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter todo',
      home: ListScreen(),
    );
  }
}
