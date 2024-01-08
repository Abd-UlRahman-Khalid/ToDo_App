import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/model/task_model.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
        fromFirestore: ((snapshot, options) => Task.fromJson(snapshot.data()!)),
        toFirestore: ((task, options) => task.toJson()),
      );
}

Future<void> addTaskToFirebase(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<List<Task>> getTask() async {
  var querySnapShot = await getTaskCollection().get();
  var tasksList = querySnapShot.docs.map((doc) => doc.data()).toList();
  return tasksList;
}

Future<QuerySnapshot<Task>> getTaskFuture() {
  return getTaskCollection().get();
}

Stream<QuerySnapshot<Task>> getTaskRealTimeUpdate() {
  return getTaskCollection().snapshots();
}

Future<void> deleteTask(Task task) {
  var taskDoc = getTaskCollection().doc(task.id);
  return taskDoc.delete();
}
