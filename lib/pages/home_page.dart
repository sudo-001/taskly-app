import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;

  _HomePageState();

  bool _homeState = true;

  void handleState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          "Taskly",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.green,
      ),
      body: _listView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _listView() {
    return ListView(
      children: [
        ListTile(
            title: Text(
              "Go to market",
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            subtitle: Text(DateTime.now().toString()),
            trailing: Icon(
              Icons.check_box_outlined,
              color: Colors.green,
            ))
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _addFormPopup,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: const Icon(Icons.add),
    );
  }

  void _addFormPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: const Text("Add new Task"),
          content: TextField(
            onSubmitted: (_value) {},
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }
}
