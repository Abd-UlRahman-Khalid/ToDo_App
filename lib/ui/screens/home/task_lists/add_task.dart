import 'package:flutter/material.dart';
import 'package:todo_app/model/dialog_utils.dart';
import 'package:todo_app/model/firebase_utlis.dart';
import 'package:todo_app/model/task_model.dart';

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Title', hintText: 'Enter task Title'),
              onChanged: (text) {
                title = text;
              },
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Please enter text Tiltle';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Descreption', hintText: 'Enter task Descrption'),
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Please enter task description';
                }
                return null;
              },
              onChanged: (text2) {
                description = text2;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Select Date',
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: showTaskDatePicke,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  AddTask();
                  // Navigator.pop(context);
                },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  void showTaskDatePicke() async {
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (selectedDate != null) {
      selectedDate = choosenDate!;
      setState(() {});
    }
  }

  void AddTask() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    Task task = Task(
      title: title,
      description: description,
      date: selectedDate.microsecondsSinceEpoch,
    );
    DialogUtils.showProgressDialog(context, 'loading....',
        isDissmisable: false);
    try {
      addTaskToFirebase(task)
        .timeout(Duration(milliseconds: 500), onTimeout: () {});
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(
        context,
        'The Task Add Successfully',
        posActionTitle: 'Ok',
        posAction: () {
          Navigator.pop(context);
        },
        isDissmisable: false,
        // negActionTitle: 'Cancle'
      );
    } catch (e) {DialogUtils.hideDialog(context);
      DialogUtils.showMessage(
        context,
        'Error Please Try Again',
        posActionTitle: 'Try again',
        posAction: () {
          AddTask();
        },
        isDissmisable: false,
        negActionTitle: 'Cancle',
        negAction: () {
          Navigator.pop(context);
        },
      );}

    
  }
}
