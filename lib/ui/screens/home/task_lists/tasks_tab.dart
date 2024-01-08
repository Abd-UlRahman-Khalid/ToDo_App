import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/firebase_utlis.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/ui/screens/home/task_lists/task_item.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  List<Task> alltasks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            activeDayColor: Theme.of(context).primaryColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: Theme.of(context).primaryColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
              child:
              StreamBuilder<QuerySnapshot<Task>>(
                stream: getTaskRealTimeUpdate(),
                builder: (buildContext, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child:
                                Text('Error Loading tasks,' 'Try again Later'),
                          );
                        }
                        var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();
                        return ListView.builder(
                            itemCount: tasks?.length ?? 0,
                            itemBuilder: (context, index) =>
                                TaskItem(tasks![index]));
                      })

                // alltasks.isEmpty? Center(child: CircularProgressIndicator()):
                    // FutureBuilder<List<Task>>(
                    //   future: getTask(),
                      // builder: (buildContext, snapshot) {
                      //   if (snapshot.connectionState ==
                      //       ConnectionState.waiting) {
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   }
                      //   if (snapshot.hasError) {
                      //     return Center(
                      //       child:
                      //           Text('Error Loading tasks,' 'Try again Later'),
                      //     );
                      //   }
                      //   var tasks = snapshot.data;
                      //   return ListView.builder(
                      //       itemCount: tasks?.length ?? 0,
                      //       itemBuilder: (context, index) =>
                      //           TaskItem(tasks![index]));
                    //   })

              // ListView.builder(
              //   itemCount: alltasks.length,
              //   itemBuilder: (context,index)=>
              // TaskItem(alltasks[index])
              // ),
              ),
        ],
      ),
    );
  }

  void loadTasks() async {
    alltasks = await getTask();
    setState(() {});
  }
}
