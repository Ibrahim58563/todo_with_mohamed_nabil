import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                return Container(
                  width: double.infinity,
                  height: 120,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 2,
                        height: 60,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Text('SubTitle',
                                  style: Theme.of(context).textTheme.subtitle2),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.check),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
