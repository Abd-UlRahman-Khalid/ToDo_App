import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Text'),
            ),
            TextFormField(
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Descreption'),
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
                child: Text('16/12/2023',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }

  void showTaskDatePicke() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
  }
}
