import 'package:flutter/material.dart';
import 'package:todo_with_mohamed_nabil/ui/home/AddTodoBottomSheet.dart';
import 'package:todo_with_mohamed_nabil/ui/home/settings_list_tab.dart';
import 'package:todo_with_mohamed_nabil/ui/home/todo_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "To do",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {
          showAddTodoSheet();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [
    TodoListTab(),
    SettingsTab(),
  ];
  showAddTodoSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return AddTodoBottomSheet();
        });
  }
}
