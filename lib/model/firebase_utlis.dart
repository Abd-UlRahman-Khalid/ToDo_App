import 'package:cloud_firestore/cloud_firestore.dart';
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
