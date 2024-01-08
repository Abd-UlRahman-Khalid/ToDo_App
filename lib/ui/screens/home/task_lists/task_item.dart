import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/model/dialog_utils.dart';
import 'package:todo_app/model/firebase_utlis.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/ui/screens/home/task_lists/edit_task_screen.dart';

class TaskItem extends StatefulWidget {
  TaskItem(this.task);

  Task task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          EditTaskScreen.routeName,
        );
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => EditTaskScreen(task),)
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 11),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Slidable(
            startActionPane: ActionPane(
                extentRatio: 0.2,
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (buildContext) {
                      deleteTasks();
                    },
                    backgroundColor: Colors.red,
                    label: 'delete',
                    icon: Icons.delete,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                  )
                ]),
            // endActionPane: ,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                      width: 2,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Theme.of(context).primaryColor,
                      )),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.task.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(widget.task.description),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    margin: EdgeInsets.only(right: 20),
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 36,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteTasks() {
    DialogUtils.showMessage(
        context, 'Are You Sure You Want to Delete this task',
        posActionTitle: 'yes', posAction: () async {
      DialogUtils.showProgressDialog(context, 'Loading...');
      await deleteTask(widget.task);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context, 'Task deleted Successfully',
          posActionTitle: 'Ok', negActionTitle: 'Undo', negAction: () {
        //Todo: Undo Delete
      });
    }, negActionTitle: 'cancle');
  }
}
