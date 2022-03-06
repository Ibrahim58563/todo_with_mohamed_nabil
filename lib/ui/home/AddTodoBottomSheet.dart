import 'package:flutter/material.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Todo",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'title',
                labelStyle: Theme.of(context).textTheme.subtitle2,
              ),
              minLines: 4,
              maxLines: 4,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'description',
                labelStyle: Theme.of(context).textTheme.subtitle2,
              ),
              minLines: 4,
              maxLines: 4,
            ),
            Text('Date'),
            InkWell(
              onTap: () {
                showDateDialoge();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1/12/2021',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }

  void showDateDialoge() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
