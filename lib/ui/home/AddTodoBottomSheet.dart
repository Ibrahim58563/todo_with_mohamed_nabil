import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_with_mohamed_nabil/data/FireStoreUtils.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  var formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String title = ' ';
  String description = ' ';

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
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (textValue) {
                      if (textValue == null || textValue.isEmpty) {
                        return 'Please enter todo title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'title',
                      labelStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                    onChanged: (text) {
                      title = text;
                    },
                    minLines: 2,
                    maxLines: 2,
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Please Enter description";
                      }
                      return null;
                    },
                    onChanged: (text) {
                      description = text;
                    },
                    decoration: InputDecoration(
                      labelText: 'description',
                      labelStyle: Theme.of(context).textTheme.subtitle2,
                    ),
                    minLines: 3,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            Text('Date'),
            InkWell(
              onTap: () {
                showDateDialoge();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addTodo();
              },
              child: Text('Add'),
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    addTodoToFireStore(title, description, selectedDate).then((value) {
      Fluttertoast.showToast(
          msg: "added sucessfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }).timeout(Duration(seconds: 20), onTimeout: () {
      Fluttertoast.showToast(
          msg: "Timed out",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void showDateDialoge() async {
    var newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      setState(() {});
    }
  }
}
