# firestore_repo

firestore_repo is a package that makes it easy to read and write Firestore Documents

## Overview


```Dart
//Initialize repo
FirestoreRepo db = FirestoreRepo();

//Read one document
db.getInstance(collectionPath: 'users', docId: 'enbjnsj1n3j39');

//Read Multiple documents from a collection
db.getInstanceAsLis5(collectionPath: 'users');

//write one document
db.setInstance(
collectionPath: 'users', 
docId: 'enbjnsj1n3j39', 
data: {'name': 'Prince'},
);

//write one document, auto-generated id
db.setInstance(
collectionPath: 'users', 
data: {'name': 'Prince'},
);
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)