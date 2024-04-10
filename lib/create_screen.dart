import 'package:flutter/material.dart';
import 'package:flutter_todolist/main.dart';
import 'package:flutter_todolist/todo.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 작성'),
        actions: [
          IconButton(
            onPressed: () async {
              // db조작은 future타입
              await todos.add(Todo(
                title: _textController.text,
                dateTime: DateTime.now().millisecondsSinceEpoch,
              ));
              // add하고 뒤로가기를 하도록 함
              // future다음에 context를 쓸 때에는 화면 없어지지 않았는지 확인 필요함
              if (mounted) {
                // mounted란 화면이 잘 표시되어있는지 확인하는 것
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: '할일을 입력하세요',
            hintStyle: TextStyle(color: Colors.grey[800]),
            filled: true,
            fillColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
