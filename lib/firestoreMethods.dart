import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chinchilla_checklist/tasks.dart';
import 'package:chinchilla_checklist/projects.dart';
import 'package:chinchilla_checklist/classes.dart';
import 'package:chinchilla_checklist/users.dart';


String userId = "dq9EjdXgwWk387huVXXC"; //demo class

//reference of main database
final CollectionReference usersCollection = Firestore.instance.collection('Users');

/*
users-----|---Tasks
          |
          |---Projects
          |
          |
          |---Users


 */

class FirebaseFirestoreService {
  String userId;

  //
  FirebaseFirestoreService(String site) {
    this.userId = site;
  }

  Future<Users> createUser(
      {
        String id,
        String name,
      //AVATAR//https://www.monstertechnocodes.com/2019/01/storing-user-data-like-name-image-to.html (tutorial for storing image data)
      int currentYear,
      String currentSemester,
      DateTime currentSemesterEndDate,
      String email,
      String password,
      int lifetimeCoins,
      int currentCoins}) async {
    final TransactionHandler createTransaction = (Transaction tx) async { //creating firestore transaction
      DocumentSnapshot ds;
      if (id != "") { //Default itemID is "" ????
        ds = await tx.get(usersCollection.document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(id)); //Note that the Equipment class is named 'Items' in collections
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['name'] = name;
      dataMap['currentYear'] = currentYear;
      dataMap['currentSemester'] = currentSemester;
      dataMap['email'] = email;
      dataMap['password'] = password;
      dataMap['lifetimeCoins'] = lifetimeCoins;
      dataMap['currentCoins'] = currentCoins;
      await tx.set(ds.reference, dataMap); //set data map to the reference for the transaction
      return dataMap;
    };
    if (id != "") {
      return usersCollection.document(id).get().then((doc) {
        if (doc.exists) {
          print("DNE");
          throw ("error: Item ID already exists"); //error for pre-created items being re-created
        } else {
          return Firestore.instance.runTransaction(createTransaction).then((mapData) {
            return Users.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      return Firestore.instance
          .runTransaction(createTransaction)
          .then((mapData) {
        return Users.fromMap(mapData);
      }).catchError((error) {
        throw ('error: unable to communicate with server');
      });
    }
  }

  Future<Tasks> createTasks(
      {
        String id,
        String name,
        DateTime dueDate,
        double timeEstimate,
        double timeCompleted,
        String semester,
        int year,
        String className,
        String projectName}) async {
    final TransactionHandler createTransaction = (Transaction tx) async { //creating firestore transaction
      DocumentSnapshot ds;
      if (id != "") { //Default itemID is "" ????
        ds = await tx.get(usersCollection.document(userId).collection("Tasks").document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(userId).collection("Tasks").document(id)); //Note that the Equipment class is named 'Items' in collections
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['name'] = name;
      dataMap['duteDate'] = dueDate;
      dataMap['timeEstimate'] = timeEstimate;
      dataMap['timeCompleted'] = timeCompleted;
      dataMap['semester'] = semester;
      dataMap['year'] = year;
      dataMap['className'] = className;
      dataMap['projectName'] = projectName;
      await tx.set(ds.reference, dataMap); //set data map to the reference for the transaction
      return dataMap;
    };
    if (id != "") {
      return usersCollection.document(userId).collection("Tasks").document(id).get().then((doc) {
        if (doc.exists) {
          print("DNE");
          throw ("error: Item ID already exists"); //error for pre-created items being re-created
        } else {
          return Firestore.instance.runTransaction(createTransaction).then((mapData) {
            return Tasks.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      return Firestore.instance
          .runTransaction(createTransaction)
          .then((mapData) {
        return Tasks.fromMap(mapData);
      }).catchError((error) {
        throw ('error: unable to communicate with server');
      });
    }
  }


  Future<Projects> createProjects(
      {
        String id,
        String projectName,
        DateTime finalDueDate,
        List<String> taskKeys, //keys of tasks which are added to the project
        String className,
        int completedTasks,
        int currentTasks}) async {
    final TransactionHandler createTransaction = (Transaction tx) async { //creating firestore transaction
      DocumentSnapshot ds;
      if (id != "") { //Default itemID is "" ????
        ds = await tx.get(usersCollection.document(userId).collection("Projects").document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(userId).collection("Projects").document(id)); //Note that the Equipment class is named 'Items' in collections
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['projectName'] = projectName;
      dataMap['finalDueDate'] = finalDueDate;
      dataMap['takeKeys'] = taskKeys;
      dataMap['className'] = className;
      dataMap['completedTasks'] = completedTasks;
      dataMap['currentTasks'] = currentTasks;
      await tx.set(ds.reference, dataMap); //set data map to the reference for the transaction
      return dataMap;
    };
    if (id != "") {
      return usersCollection.document(userId).collection("Projects").document(id).get().then((doc) {
        if (doc.exists) {
          print("DNE");
          throw ("error: Item ID already exists"); //error for pre-created items being re-created
        } else {
          return Firestore.instance.runTransaction(createTransaction).then((mapData) {
            return Projects.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      return Firestore.instance
          .runTransaction(createTransaction)
          .then((mapData) {
        return Projects.fromMap(mapData);
      }).catchError((error) {
        throw ('error: unable to communicate with server');
      });
    }
  }

  Future<Classes> createClasses(
      {
        String id,
        String className,
        DateTime endDate,
        DateTime startDate,
        List<String> taskKeys, //keys of tasks which are added to the project
        List<String> projectKeys,
        int completedTasks,
        int currentTasks}) async {
    final TransactionHandler createTransaction = (Transaction tx) async { //creating firestore transaction
      DocumentSnapshot ds;
      if (id != "") { //Default itemID is "" ????
        ds = await tx.get(usersCollection.document(userId).collection("Classes").document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(userId).collection("Classes").document(id)); //Note that the Equipment class is named 'Items' in collections
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['className'] = className;
      dataMap['endDate'] = endDate;
      dataMap['startDate'] = startDate;
      dataMap['taskKeys'] = taskKeys;
      dataMap['projectKeys'] = projectKeys;
      dataMap['completedTasks'] = completedTasks;
      dataMap['currentTasks'] = currentTasks;
      await tx.set(ds.reference, dataMap); //set data map to the reference for the transaction
      return dataMap;
    };
    if (id != "") {
      return usersCollection.document(userId).collection("Classes").document(id).get().then((doc) {
        if (doc.exists) {
          print("DNE");
          throw ("error: Item ID already exists"); //error for pre-created items being re-created
        } else {
          return Firestore.instance.runTransaction(createTransaction).then((mapData) {
            return Classes.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      return Firestore.instance
          .runTransaction(createTransaction)
          .then((mapData) {
        return Classes.fromMap(mapData);
      }).catchError((error) {
        throw ('error: unable to communicate with server');
      });
    }
  }

  Future<dynamic> updateUsers(
      {  String id,
        String name,
        //AVATAR//https://www.monstertechnocodes.com/2019/01/storing-user-data-like-name-image-to.html (tutorial for storing image data)
        int currentYear,
        String currentSemester,
        DateTime currentSemesterEndDate,
        String email,
        String password,
        int lifetimeCoins,
        int currentCoins}) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      DocumentSnapshot ds;
      if (id != "") {
        ds = await tx.get(usersCollection.document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(id)); //Note that Equipment was changed to 'Items'
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();

      await tx.set(ds.reference, dataMap);
      dataMap['id'] = id;
      dataMap['name'] = name;
      dataMap['currentYear'] = currentYear;
      dataMap['currentSemester'] = currentSemester;
      dataMap['email'] = email;
      dataMap['password'] = password;
      dataMap['lifetimeCoins'] = lifetimeCoins;
      dataMap['currentCoins'] = currentCoins;
      return dataMap;
    };
    if (id != "") {
      return usersCollection
          .document(id).get().then((doc) {
        if (doc.exists) {
          return Firestore.instance
              .runTransaction(createTransaction)
              .then((mapData) {
            return Users.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        } else {
          throw ('error: could not find matching item');
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      throw ("error: Item ID is required to update");
    }
  }

  Future<dynamic> updateTasks(
      {  String id,
        String name,
        DateTime dueDate,
        double timeEstimate,
        double timeCompleted,
        String semester,
        int year,
        String className,
        String projectName }) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      DocumentSnapshot ds;
      if (id != "") {
        ds = await tx.get(usersCollection.document(userId));
      } else {
        ds = await tx.get(
            usersCollection.document(id)); //Note that Equipment was changed to 'Items'
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['name'] = name;
      dataMap['duteDate'] = dueDate;
      dataMap['timeEstimate'] = timeEstimate;
      dataMap['timeCompleted'] = timeCompleted;
      dataMap['semester'] = semester;
      dataMap['year'] = year;
      dataMap['className'] = className;
      dataMap['projectName'] = projectName;
      await tx.set(ds.reference, dataMap);
      return dataMap;
    };
    if (id != "") {
      return usersCollection
          .document(userId).collection("Tasks").document(id).get().then((doc) {
        if (doc.exists) {
          return Firestore.instance
              .runTransaction(createTransaction)
              .then((mapData) {
            return Tasks.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        } else {
          throw ('error: could not find matching item');
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      throw ("error: Item ID is required to update");
    }
  }

  Future<dynamic> updateProjects(
      {  String id,
        String projectName,
        DateTime finalDueDate,
        List<String> taskKeys, //keys of tasks which are added to the project
        String className,
        int completedTasks,
        int currentTasks }) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      DocumentSnapshot ds;
      if (id != "") {
        ds = await tx.get(usersCollection.document(userId).collection("Projects").document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(userId).collection("Projects").document(id)); //Note that Equipment was changed to 'Items'
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['projectName'] = projectName;
      dataMap['finalDueDate'] = finalDueDate;
      dataMap['takeKeys'] = taskKeys;
      dataMap['className'] = className;
      dataMap['completedTasks'] = completedTasks;
      dataMap['currentTasks'] = currentTasks;
      await tx.set(ds.reference, dataMap);
      return dataMap;
    };
    if (id != "") {
      return usersCollection
          .document(userId).collection("Projects").document(id).get().then((doc) {
        if (doc.exists) {
          return Firestore.instance
              .runTransaction(createTransaction)
              .then((mapData) {
            return Projects.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        } else {
          throw ('error: could not find matching item');
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      throw ("error: Item ID is required to update");
    }
  }

  Future<dynamic> updateClasses(
      { String id,
        String className,
        DateTime endDate,
        DateTime startDate,
        List<String> taskKeys, //keys of tasks which are added to the project
        List<String> projectKeys,
        int completedTasks,
        int currentTasks }) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      DocumentSnapshot ds;
      if (id != "") {
        ds = await tx.get(usersCollection.document(userId).collection("Classes").document(id));
      } else {
        ds = await tx.get(
            usersCollection.document(userId).collection("Classes").document(id)); //Note that Equipment was changed to 'Items'
        id = ds.documentID;
      }

      var dataMap = new Map<String, dynamic>();
      dataMap['id'] = id;
      dataMap['className'] = className;
      dataMap['endDate'] = endDate;
      dataMap['startDate'] = startDate;
      dataMap['taskKeys'] = taskKeys;
      dataMap['projectKeys'] = projectKeys;
      dataMap['completedTasks'] = completedTasks;
      dataMap['currentTasks'] = currentTasks;
      await tx.set(ds.reference, dataMap);
      return dataMap;
    };
    if (id != "") {
      return usersCollection
          .document(userId).collection("Classes").document(id).get().then((doc) {
        if (doc.exists) {
          return Firestore.instance
              .runTransaction(createTransaction)
              .then((mapData) {
            return Classes.fromMap(mapData);
          }).catchError((error) {
            throw ('error: unable to communicate with server');
          });
        } else {
          throw ('error: could not find matching item');
        }
      }).catchError((e) {
        throw (e);
      });
    } else {
      throw ("error: Item ID is required to update");
    }
  }



}