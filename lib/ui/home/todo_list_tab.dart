import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_with_mohamed_nabil/data/FireStoreUtils.dart';
import 'package:todo_with_mohamed_nabil/data/Todo.dart';
import 'package:todo_with_mohamed_nabil/extensions.dart';
import 'package:todo_with_mohamed_nabil/ui/home/todo_widget.dart';

class TodoListTab extends StatefulWidget {
  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.week,
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              todayTextStyle: TextStyle(
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              defaultTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              weekdayStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDay);
            },
            onDaySelected: (sDay, fDay) {
              setState(() {
                selectedDay = sDay;
                focusedDay = fDay;
              });
            },
            weekendDays: [],
            focusedDay: focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(
              Duration(days: 365),
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Todo>>(
            stream: getTodosCollectionWithConverter()
                .where('dateTime', isEqualTo: selectedDay.getDateOnly)
                .snapshots(),
            builder: (BuildContext buildContext,
                AsyncSnapshot<QuerySnapshot<Todo>> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<Todo> items =
                  snapshot.data!.docs.map((el) => el.data()).toList();
              return ListView.builder(
                itemBuilder: (buildContext, index) {
                  return TodoWidget(items[index]);
                },
                itemCount: items.length,
              );
              ;
            },
          )),
        ],
      ),
    );
  }
}
