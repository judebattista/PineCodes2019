import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chinchilla_checklist/tasks.dart';
import 'package:chinchilla_checklist/projects.dart';
import 'package:chinchilla_checklist/classes.dart';
import 'package:chinchilla_checklist/users.dart';


//reference of main database
final CollectionReference usersCollection = Firestore.instance.collection('Users');

class FirebaseFirestoreService {

}