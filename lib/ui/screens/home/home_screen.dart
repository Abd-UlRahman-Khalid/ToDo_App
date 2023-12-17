import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home/settings/settings_tab.dart';
import 'package:todo_app/ui/screens/home/task_lists/add_task.dart';
import 'package:todo_app/ui/screens/home/task_lists/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndexTab = index;
              });
            },
            currentIndex: selectedIndexTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ]),
      ),
      body: tabs[selectedIndexTab],
    );
  }

  var tabs = [TasksTab(), SettingsTab()];
  void showAddTaskBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext)=>AddTask());
  }
}
