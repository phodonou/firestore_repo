library firestore_repo;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreRepo {
  final Firestore _firestoreInstance = Firestore.instance;

  Future<List<DocumentSnapshot>> getInstancesAsList({
    @required String path,
  }) async {
    QuerySnapshot future =
        await _firestoreInstance.collection(path).getDocuments();
    return future.documents;
  }

  Future<DocumentSnapshot> getInstance({
    @required String path,
    @required String docId,
  }) async {
    DocumentSnapshot docSnap =
        await _firestoreInstance.collection(path).document(docId).get();
    return docSnap;
  }

  Future setInstance({
    @required String path,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference ref = _firestoreInstance.collection(path).document(docId);
    await ref.setData(data, merge: true).catchError((err) {
      print(err);
    });
  }

  Future<String> setInstanceNoID({
    @required String path,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference ref = _firestoreInstance.collection(path).document();
    await ref.setData(data, merge: true);
    return ref.documentID;
  }

  Future updateInstance({
    @required String path,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    try {
      await _firestoreInstance
          .collection(path)
          .document(docId)
          .updateData(data);
    } catch (e) {}
  }

  Future deleteInstance({
    @required String path,
    @required String docId,
  }) async {
    try {
      await _firestoreInstance.collection(path).document(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  Firestore get firestoreInstance => _firestoreInstance;
}