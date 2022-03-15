import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_mohamed_nabil/data/Todo.dart';

CollectionReference<Todo> getTodosCollectionWithConverter() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionName)
      .withConverter<Todo>(
          fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
          toFirestore: (item, _) => item.toJson());
}

Future<void> addTodoToFireStore(
    String title, String description, DateTime dateTime) async {
  CollectionReference<Todo> collectionReference =
      getTodosCollectionWithConverter();
  DocumentReference<Todo> docRef = collectionReference.doc();
  Todo item = Todo(
    id: docRef.id,
    title: title,
    description: description,
    dateTime: dateTime,
  );
  docRef.set(item);
}

Future<void> deleteTodo(Todo item) {
  CollectionReference<Todo> collectionReference =
      getTodosCollectionWithConverter();
  DocumentReference<Todo> itemDoc = collectionReference.doc(item.id);
  return itemDoc.delete();
}
