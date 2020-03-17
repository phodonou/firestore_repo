library firestore_repo;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreRepo {
  final Firestore _firestoreInstance = Firestore.instance;

  /// Read multiple Documents from a collection
  Future<List<DocumentSnapshot>> getDocumentsAsList({
    @required String collectionPath,
  }) async {
    QuerySnapshot future =
        await _firestoreInstance.collection(collectionPath).getDocuments();
    return future.documents;
  }

  /// Read a single Document
  Future<DocumentSnapshot> getDocument({
    @required String collectionPath,
    @required String docId,
  }) async {
    DocumentSnapshot docSnap = await _firestoreInstance
        .collection(collectionPath)
        .document(docId)
        .get();
    return docSnap;
  }

  /// Write a single Document
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

  /// Write a single Document, auto-generates the Id
  Future<String> setDocumentNoID({
    @required String collectionPath,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference ref =
        _firestoreInstance.collection(collectionPath).document();
    await ref.setData(data, merge: true);
    return ref.documentID;
  }

  /// Update a single Document
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

  /// Delete a single Document
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

  /// Get the Firestore Instance
  Firestore get firestoreInstance => _firestoreInstance;
}
