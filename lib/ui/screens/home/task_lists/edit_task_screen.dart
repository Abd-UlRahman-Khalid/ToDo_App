import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

class EditTaskScreen extends StatelessWidget {
  static const String routeName = "editScreen";
    // EditTaskScreen(this.task);
    // Task task;
  @override
  Widget build(BuildContext context) {
    // var tasks=ModalRoute.of(context)!.settings.arguments as Task;
    var mediaQuery = MediaQuery.of(context).size;
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('To Do List'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: mediaQuery.height * 0.2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    width: mediaQuery.width * 0.85,
                    height: mediaQuery.height * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Text(
                          'Edit Task',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 25),
                        ),
                        const SizedBox(height: 60),
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                initialValue: "",
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                initialValue: "",
                              ),
                              const SizedBox(height: 60),
                              Text('Select Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontSize: 25)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
