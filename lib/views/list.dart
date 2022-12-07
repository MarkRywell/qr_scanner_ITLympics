import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  List list1 = [
    {
      'title': "Mark",
      'completed' : true
    },
    {
      'title': "Rywell",
      'completed' : false
    },
    {
      'title': "Mark",
      'completed' : false
    }];

  List todos = <dynamic>[];

  fetchData() async {

    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    setState(() {
      todos = convert.jsonDecode(response.body);
    });

    print(todos);
  }

  deleteData(var todo) async {

    await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/todos/${todo['id']}'));

    setState(() {
      todos.remove(todo);
    });
  }


  @override
  void initState() {
    fetchData();
    super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {

            final todo = todos[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Card(
                child: ListTile(
                  title: Text(todo['title']),
                  leading: Checkbox(
                    value: todo['completed'],
                    onChanged: (bool? newValue) {
                      setState(() {
                        todo['completed'] = newValue!;
                      });
                      print(todo['completed']);
                    },
                  ),
                  trailing: Container(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            print("Nagedit ko");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                              deleteData(todo);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              );
          },
      )
    );
  }
}
