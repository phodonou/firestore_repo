library firestore_repo;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreRepo {
  final Firestore _firestoreInstance = Firestore.instance;

  Future<List<DocumentSnapshot>> getDocumentsAsList({
    @required String collectionPath,
  }) async {
    QuerySnapshot future =
        await _firestoreInstance.collection(collectionPath).getDocuments();
    return future.documents;
  }

  Future<DocumentSnapshot> getDocuments({
    @required String collectionPath,
    @required String docId,
  }) async {
    DocumentSnapshot docSnap = await _firestoreInstance
        .collection(collectionPath)
        .document(docId)
        .get();
    return docSnap;
  }

  Future setDocument({
    @required String collectionPath,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference ref =
        _firestoreInstance.collection(collectionPath).document(docId);
    await ref.setData(data, merge: true).catchError((err) {
      print(err);
    });
  }

  Future<String> setDocumentNoID({
    @required String collectionPath,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference ref =
        _firestoreInstance.collection(collectionPath).document();
    await ref.setData(data, merge: true);
    return ref.documentID;
  }

  Future updateDocument({
    @required String collectionPath,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    try {
      await _firestoreInstance
          .collection(collectionPath)
          .document(docId)
          .updateData(data);
    } catch (e) {}
  }

  Future deleteDocument({
    @required String collectionPath,
    @required String docId,
  }) async {
    try {
      await _firestoreInstance
          .collection(collectionPath)
          .document(docId)
          .delete();
    } catch (e) {
      print(e);
    }
  }

  Firestore get firestoreInstance => _firestoreInstance;
}
