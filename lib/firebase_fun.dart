import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/collectionClass/task.dart';

CollectionReference<Task> getCollectionFromFirebase (){
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
    fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!),
    toFirestore: (task, _) => task.toJson(),
  );
  }

 Future<void> addTaskToFirebase (Task task){
 var collection = getCollectionFromFirebase() ;
 var doc = collection.doc();
 task.id =  doc.id ;
return doc.set(task) ;

}
Future<void> deleteTaskFromFireBase (Task task){
 return getCollectionFromFirebase().doc(task.id).delete();

}

Future<void>isDoneTask (Task task) async {
  return getCollectionFromFirebase().doc(task.id).update({
    "isDone" : true
  }
  );
}



