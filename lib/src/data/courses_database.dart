import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/src/models/app_course.dart';

class CoursesDatabase {
  // 1
  final CollectionReference<Map<String, dynamic>> collection =
  FirebaseFirestore.instance.collection('courses');
  // 2
  Stream<QuerySnapshot<Map<String, dynamic>>> getStream() {
    return collection.snapshots();
  }
  // 3
  Future<DocumentReference<Map<String, dynamic>>> addPet(Course course) {
    return collection.add(course.toJson());
  }
  // 4
  void updateCourse(Course course) async {
    await collection.doc(course.referenceId).update(course.toJson());
  }
  // 5
  void deleteCourse(Course course) async {
    await collection.doc(course.referenceId).delete();
  }
}


/*
class CoursesDatabase {
  // 1
  final CollectionReference<Map<String, dynamic>> collection =
  FirebaseFirestore.instance.collection('courses');
  // 2
  Future<Stream<QuerySnapshot<Object?>>> getStream() async {
    return collection.snapshots();
  }
  // 3
  Future<DocumentReference> addCourse(AppCourse course) async {
    return collection.add(course.toJson());
  }
  // 4
  void updateCourse(AppCourse course) async {
    await collection.doc(course.referenceId).update(course.toJson());
  }
  // 5
  void deleteCourse(AppCourse course) async {
    await collection.doc(course.referenceId).delete();
  }
}
*/
