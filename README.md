# firestore_repo

firestore_repo is a dart package that makes it easy to read and write Firestore Documents

## Requirements
You must first install the cloud_firestore package: 
https://pub.dev/packages/cloud_firestore

## Overview


```Dart
//Initialize repo
FirestoreRepo db = FirestoreRepo();

//Read one document
db.getInstance(
collectionPath: 'users', 
docId: 'enbjnsj1n3j39',
);

//Read Multiple documents from a collection
db.getInstanceAsList(collectionPath: 'users');

//write one document
db.setInstance(
collectionPath: 'users', 
docId: 'enbjnsj1n3j39', 
data: {'name': 'Prince',
});

//write one document, auto-generates id
db.setInstanceNoID(
collectionPath: 'users', 
data: {
'name': 'Prince', 
'last_name': 'Hodonou',
});

//update a document
db.updateInstance(
collectionPath: 'users',
docId:'enbjnsj1n3j39',
newData: {
'name': 'King', 
'last_name': 'George',
})

//delete a document
db.deleteInstance(
collectionPath: 'users', 
docId: 'enbjnsj1n3j39',
);

//get the Firestore Instance
Firestore firestoreInstance = db.firestoreInstance;
//Read Multiple documents from a collection
List<DocumentSnapshot> users = (await firestoreInstance
.collection('users')
.getDocuments()).documents;
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)